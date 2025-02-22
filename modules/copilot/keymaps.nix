{ helpers, config, ... }:
let inherit (config.nvix.mkKey) mkKeymap wKeyObj;
in {
  wKeyList = [ (wKeyObj [ "<leader>a" "󰚩" "ai" ]) ];
  keymaps = [
    (mkKeymap "n" "<leader>ac"
      (helpers.mkRaw # lua
        ''
          function()
            if vim.b.copilot_status == "running" then
              vim.b.copilot_status = "stopped"
              vim.cmd("Copilot detach")
            else
              vim.b.copilot_status = "running"
              vim.cmd("Copilot enable")
              vim.cmd("Copilot! attach")
            end
          end
        '')
      "Toggle Copilot")
  ];
}
