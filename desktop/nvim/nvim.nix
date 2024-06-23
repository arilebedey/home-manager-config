{ config, pkgs, inputs, ... }:
{
  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          own-maximize-vim = prev.vimUtils.buildVimPlugin {
            name = "vim-maximizer";
            src = inputs.plugin-maximizer;
          };
        };
      })
    ];
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.neovim =
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

    viAlias = true;
    vimdiffAlias = true;
    vimAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
      ${builtins.readFile ./nvim/keymaps.lua}
    '';

    extraPackages = with pkgs; [
      lua-language-server
      nodePackages_latest.typescript-language-server
      typescript
      vscode-langservers-extracted
      tailwindcss-language-server
      nodePackages_latest.pyright
      nodePackages_latest.prettier
      stylua
      black
      isort
      eslint_d
      pylint
    ];

    plugins = with pkgs.vimPlugins; [

      cmp-nvim-lsp

      {
        plugin = everforest;
        config = "colorscheme everforest";
      }

      neodev-nvim

      cmp-buffer
      cmp-path
      cmp_luasnip
      friendly-snippets
      lspkind-nvim
      #cmp-fuzzy-buffer
      #cmp-fuzzy-path
      #fuzzy-nvim
      nvim-cmp 

      {
        plugin = nvim-cmp;
        config = toLuaFile ./nvim/plugin/cmp.lua;
      }

      {
        plugin = telescope-nvim;
        config = toLuaFile ./nvim/plugin/telescope.lua;
      }

      telescope-fzf-native-nvim

      luasnip
      friendly-snippets

      nvim-web-devicons

      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-javascript
          p.tree-sitter-tsx
          p.tree-sitter-yaml
          p.tree-sitter-typescript
          p.tree-sitter-toml
          p.tree-sitter-css
          p.tree-sitter-html
          p.tree-sitter-prisma
          p.tree-sitter-markdown
          p.tree-sitter-markdown-inline
          p.tree-sitter-graphql
          p.tree-sitter-bash
          p.tree-sitter-dockerfile
          p.tree-sitter-gitignore
          p.tree-sitter-query
          p.tree-sitter-vimdoc
          p.tree-sitter-c
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
        ]));
        config = toLuaFile ./nvim/plugin/treesitter.lua;
      }


      vim-nix
	  everforest

      plenary-nvim
      vim-tmux-navigator
      nvim-web-devicons
      nvim-ts-context-commentstring

      {
        plugin = comment-nvim;
        #event = toLua "{ \"BufReadPre\", \"BufNewFile\" },";
        #config = toLua "require(\"Comment\").setup()";
        config = toLuaFile ./nvim/plugin/comment.lua;
      }

      {
        plugin = which-key-nvim;
        config = toLuaFile ./nvim/plugin/which-key.lua;
      }

      # {
      #   plugin = vim-startify;
      #   config = toLuaFile ./nvim/plugin/vim-startify.lua;
      # }

      {
        plugin = auto-session;
        config = toLuaFile ./nvim/plugin/auto-session.lua;
      }

      {
        plugin = nvim-tree-lua;
        config = toLuaFile ./nvim/plugin/nvimtree.lua;
      }

      {
        plugin = bufferline-nvim;
        config = toLuaFile ./nvim/plugin/bufferline.lua;
      }

      {
        plugin = lualine-nvim;
        config = toLuaFile ./nvim/plugin/lualine.lua;
      }

      {
        plugin = dressing-nvim;
        config = toLuaFile ./nvim/plugin/dressing.lua;
      }

      {
        plugin = own-maximize-vim;
        config = toLuaFile ./nvim/plugin/vim-maximizer.lua;
      }

      nvim-ts-autotag

      {
        plugin = project-nvim;
        config = toLuaFile ./nvim/plugin/project.lua;
      }

      {
        plugin = indent-blankline-nvim;
        config = toLuaFile ./nvim/plugin/indent-blankline.lua;
      }

      {
        plugin = nvim-autopairs;
        config = toLuaFile ./nvim/plugin/autopairs.lua;
      }
      
      {
        plugin = todo-comments-nvim;
        config = toLuaFile ./nvim/plugin/todo.lua;
      }

      {
        plugin = substitute-nvim;
        config = toLuaFile ./nvim/plugin/substitute.lua;
      }

      {
        plugin = nvim-surround;
        config = toLua "require(\"nvim-surround\").setup()";
        # cs"'
        # ds"
        # ysiw
        # or t for tags!
      }

      # {
      #   plugin = vimPlugins.own-onedark-nvim;
      #   config = "colorscheme onedark";
      # }

      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./nvim/plugin/lsp.lua;
      }

      {
        plugin = trouble-nvim;
        config = toLuaFile ./nvim/plugin/trouble.lua;
      }

      {
        plugin = conform-nvim;
        config = toLuaFile ./nvim/plugin/formatting.lua;
      }

      {
        plugin = nvim-lint;
        config = toLuaFile ./nvim/plugin/linting.lua;
      }

      {
        plugin = gitsigns-nvim;
        config = toLuaFile ./nvim/plugin/gitsigns.lua;
      }

    ];
  };
}
