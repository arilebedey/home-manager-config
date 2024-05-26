{
  description = "Home Manager configuration of ari";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nix-kickstart.nvim
    nvim-nix = {
      url = "/home/ari/Code/nix/nix-kickstart.nvim/";
      # url = "github:nix-community/kickstart-nix.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # vim-maximizer
    plugin-maximizer.url = "github:szw/vim-maximizer";
    plugin-maximizer.flake = false;
  };

  outputs = { nixpkgs, home-manager, nvim-nix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          nvim-nix.overlays.default
        ];
      };

      overlay-davinci-resolve-studio = old: prev: {
        davinci-resolve-studio = prev.davinci-resolve-studio.override (old: {
          buildFHSEnv = a: (old.buildFHSEnv (a // {
            extraBwrapArgs = a.extraBwrapArgs ++ [
              "--bind /run/opengl-driver/etc/OpenCL /etc/OpenCL"
            ];
          }));
        });
      };
    in {
      homeConfigurations."ari" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        extraSpecialArgs = { inherit inputs; };
        # nixpkgs.overlays = [
        #   # replace <kickstart-nix-nvim> with the name you chose
        #   nvim-nix.overlays.default
        # ];
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
