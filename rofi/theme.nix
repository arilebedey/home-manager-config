{ config, ... }: {
  theme =
    let
    # Use `mkLiteral` for string-like values that should show without
    # quotes, e.g.:
    # {
    #   foo = "abc"; =&gt; foo: "abc";
    #   bar = mkLiteral "abc"; =&gt; bar: abc;
    # };
      inherit (config.lib.formats.rasi) mkLiteral;
    in 
    {
      "*" = {
          font = "Figtree 19";
          g-spacing = "10px";
          g-margin = 0;
          b-color = "#000000FF";
          fg-color = "#FFFFFFFF";
          fgp-color = "#888888FF";
          b-radius = "8px";
          g-padding = "8px";
          hl-color = "#FFFFFFFF";
          hlt-color = "#000000FF";
          alt-color = "#111111FF";
          wbg-color = "#000000CC";
          w-border = "2px solid";
          w-border-color = "#FFFFFFFF";
          w-padding = "12px";
      };
      
      "configuration" = {
          modi = "drun";
          show-icons = true;
          display-drun = "";
      };
    
      "listview" = {
          columns = 1;
          lines = 7;
          fixed-height = true;
          fixed-columns = true;
          cycle = false;
          scrollbar = false;
          border = "0px solid";
      };
    
      "window" = {
          transparency = "real";
          width = "450px";
          border-radius = mkLiteral "@b-radius";
          background-color = "@wbg-color";
          border = mkLiteral "@w-border";
          border-color = mkLiteral "@w-border-color";
          padding = mkLiteral "@w-padding";
      };
    
      "prompt" = {
          text-color = mkLiteral "@fg-color";
      };
    
      "inputbar" = {
          children = mkLiteral "[prompt, entry]";
          spacing = mkLiteral "@g-spacing";
      };
    
      "entry" = {
          placeholder = "Search Apps";
          text-color = mkLiteral "@fg-color";
          placeholder-color = mkLiteral "@fgp-color";
      };
    
      "mainbox" = {
          spacing = mkLiteral "@g-spacing";
          margin = mkLiteral "@g-margin";
          padding = mkLiteral "@g-padding";
          children = mkLiteral "[inputbar, listview, message]";
      };
    
      "element" = {
          spacing = mkLiteral "@g-spacing";
          margin = mkLiteral "@g-margin";
          padding = mkLiteral "@g-padding";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "@b-radius";
          border-color = mkLiteral "@b-color";
          background-color = "transparent";
          text-color = mkLiteral "@fg-color";
      };
    
      "element normal.normal" = {
      	background-color = "transparent";
      	text-color = "@fg-color";
      };
    
      "element alternate.normal" = {
      	background-color = mkLiteral "@alt-color";
      	text-color = mkLiteral "@fg-color";
      };
    
      "element selected.active" = {
      	background-color = mkLiteral "@hl-color";
      	text-color = mkLiteral "@hlt-color";
      };
    
      "element selected.normal" = {
      	background-color = "@hl-color";
      	text-color = "@hlt-color";
      };
    
      "message" = {
          background-color = "red";
          border = "0px solid";
      };
    };
}
