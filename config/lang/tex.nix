{
  plugins = {
    ltex-extra = {
      enable = true;
      settings = {
        load_langs = [
          "en-US"
          "de-DE"
        ];
      };
    };
    vimtex.enable = true;
  };
  extraConfigLua = # lua
    ''
      vim.cmd([[let maplocalleader = " t"]])
    '';
}
