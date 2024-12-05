{ lib, mkKey, helpers, specObj, pkgs, ... }:
let
  inherit (mkKey) mkKeymap;
in
with lib;
{
  plugins = {
    conform-nvim.enable = mkDefault true;
    lsp = {
      enable = mkDefault true;
      inlayHints = mkDefault true;
      servers.nil_ls = {
        enable = true;
        settings.formatting.command = [ "${lib.getExe pkgs.nixpkgs-fmt}" ];
      };
    };
  };

  extraConfigLua = # lua
    ''
      vim.keymap.set("n", "<leader>lf", function() require("conform").format() end, { noremap = true, silent = true, desc = "Format Buffer" })
      vim.keymap.set("v", "<leader>lf", function() require("conform").format() { async = true } end, { noremap = true, silent = true, desc = "Format Buffer" })
      vim.keymap.set("x", "<leader>lf", function() require("conform").format() { async = true } end, { noremap = true, silent = true, desc = "Format Buffer" })

    '';

  wKeyList = [
    (specObj [ "<leader>l" "󰿘" "lsp" ])
    (specObj [ "<leader>n" "" "nh" ])
  ];

  keymaps = [
    (mkKeymap "n" "<leader>nh"
      (helpers.mkRaw # lua
      ''
        function ()
          -- Open a new floating terminal window
          local buf = vim.api.nvim_create_buf(false, true)
          local win = vim.api.nvim_open_win(buf, true, {
            relative = 'editor',
            width = 120,
            height = 10,
            col = 20,
            row = vim.o.lines - 10,
            border = 'rounded',
            style = 'minimal',
          })

          -- Run the command in the terminal
          vim.fn.termopen("nh home switch", {
            on_exit = function(_, code)
              if code ~= 0 then
                vim.notify("Command exited with code " .. code, vim.log.levels.ERROR)
              else
                if vim.api.nvim_win_is_valid(win) then
                  vim.api.nvim_win_close(win, false)
                end
                if vim.api.nvim_buf_is_valid(buf) then
                  vim.api.nvim_buf_delete(buf, { force = true })
                end
              end
            end,
          })

          vim.api.nvim_win_set_cursor(0, { 10, 0 })

          -- Set keybinding to close the floating window with 'q'
          vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end
      '')
    "Switch Home")

    (mkKeymap "n" "<leader>ns"
      (helpers.mkRaw # lua
      ''
        function ()
          -- Open a new floating terminal window
          local buf = vim.api.nvim_create_buf(false, true)
          local win = vim.api.nvim_open_win(buf, true, {
            relative = 'editor',
            width = 120,
            height = 10,
            col = 20,
            row = vim.o.lines - 10,
            border = 'rounded',
            style = 'minimal',
          })

          -- Run the command in the terminal
          vim.fn.termopen("nh os switch", {
            on_exit = function(_, code)
              if code ~= 0 then
                vim.notify("Command exited with code " .. code, vim.log.levels.ERROR)
              else
                if vim.api.nvim_win_is_valid(win) then
                  vim.api.nvim_win_close(win, false)
                end
                if vim.api.nvim_buf_is_valid(buf) then
                  vim.api.nvim_buf_delete(buf, { force = true })
                end
              end
            end,
          })

          vim.api.nvim_win_set_cursor(0, { 10, 0 })

          -- Set keybinding to close the floating window with 'q'
          vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end
      '')
    "Switch System")
  ];
}
