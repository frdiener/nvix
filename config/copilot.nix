{mkKey, ...}:
let
  inherit (mkKey) mkKeymap;
in{
  plugins.copilot-lua = {
    enable = true;
    filetypes=  {
      "*" = false;
    };
    suggestion = {
      enabled = true;
      autoTrigger = true;
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>ucc" {
      __raw = #lua
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
      '';
     }
     "Toggle Copilot")
  ];
}
