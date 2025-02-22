{ helpers, config, ... }:
let inherit (config.nvix.mkKey) mkKeymap wKeyObj;
in {
  wKeyList = [ (wKeyObj [ "<leader>a" "󰚩" "ai" ]) ];
  keymaps = [
    (mkKeymap "n" "<leader>ag"
      (helpers.mkRaw # lua
      ''
        function()
          vim.cmd("ChatGPT")
        end
      '')
    "Toggle ChatGPT")
  ];
}
