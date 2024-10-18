{ specObj, pkgs, ... }:
{
  plugins = {
    lsp.servers.texlab.enable = true;
    vimtex = {
      enable = true;
      texlivePackage = pkgs.texlive.combined.scheme-full;
    };
    ltex-extra = {
      enable = true;
      settings = {
        load_langs = [
          "en-US"
          "de-DE"
        ];
      };
    };
  };

  extraConfigLua = # lua
    ''
      vim.cmd([[let maplocalleader = " t"]])
    '';
  globals = {
    maplocalleader = " t"; # Set the local leader to "<leader>t"
  };

  wKeyList = [
    (specObj [ "<leader>t" "" "tex" ])
    (specObj [ "<leader>tl" "" "vimtex" ])
  ];
}
