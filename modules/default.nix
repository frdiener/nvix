{
  flake.nvixModules = {
    utils = ./utils; # Contains utility functions

    git = ./git;
    lsp = ./lsp;
    cmp = ./cmp;
    tex = ./tex;
    lang = ./lang;
    nixos = ./nixos;
    dadbod = ./dadbod;
    molten = ./molten;
    snacks = ./snacks;
    buffer = ./buffer; # Buffer manager/bufferline
    chatgpt = ./chatgpt;
    general = ./general; # General Neovim config
    lualine = ./lualine;
    copilot = ./copilot;
    explorer = ./explorer;
    firenvim = ./firenvim;
    dashboard = ./dashboard;
    aesthetics = ./aesthetics;
    treesitter = ./treesitter;
    auto-session = ./auto-session;
    colorschemes = ./colorschemes;
  };
}
