{ helpers, config, ... }:
let inherit (config.nvix.mkKey) mkKeymap wKeyObj;
in {
  wKeyList = [ (wKeyObj [ "<leader>n" "" "nh" ]) ];
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
