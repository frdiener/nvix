{ pkgs, config, lib, ... }:
let inherit (config.nvix.mkKey) wKeyObj;
in {

  plugins = {
    lsp.servers.texlab.enable = true;
    vimtex = {
      enable = true;
      texlivePackage = pkgs.texlive.combined.scheme-full;
    };
    lsp.servers.ltex = {
      enable = true;
      autostart = false;
      settings = {
        enabled = true;
        language = "de-DE";
        additionalRules = {
          motherTongue = "de-DE";
          enablePickyRules = true;
          completionEnabled = true;
        };
      };
    };
    ltex-extra = {
      enable = true;
      settings = {
        initCheck = true;
        load_langs = [
          "en-US"
          "de-DE"
        ];
      };
    };
  };

  extraConfigLuaPre = ''
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = ".build" -- you can set here whatever name you desire
    }
  '';

  globals.maplocalleader = " t"; # Set the local leader to "<leader>t"

  wKeyList = [
    (wKeyObj [ "<leader>t" "" "tex" ])
    (wKeyObj [ "<leader>tl" "" "vimtex" ])
  ];
  imports = with builtins; with lib;
    map
      (fn: ./${fn})
      (filter
        (fn: (
          fn != "default.nix"
          && !hasSuffix ".md" "${fn}"
        ))
        (attrNames (readDir ./.)));
}
