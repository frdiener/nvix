{mkKey, ...}:
let
  inherit (mkKey) mkKeymap;
in{
  plugins.copilot-lua = {
    enable = true;
    filetypes=  {
      "*" = false;
      "copilot" = true;
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
        function(ot disable")
          else
            vim.g.copilot_status = "running"
            vim.cmd("Copilot enable")
          end
        end
      '';
     }
     "Toggle Copilot")
    (mkKeymap "n" "<leader>ucf" {
      __raw = #lua
      ''
        function ()
          local original_filetype = vim.bo.filetype
          vim.bo.filetype = "copilot"
          vim.cmd('Copilot enable')
          vim.bo.filetype = original_filetype
          print("Copilot enabled for this buffer.")
        end
      '';
    } "ForceEnableCopilotForBuffer")
  ];
}
