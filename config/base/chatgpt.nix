{
  pkgs,
  mkKey,
  helpers,
  specObj,
  ...
}:
let
  inherit (mkKey) mkKeymap;
in
{
  plugins.chatgpt = {
    enable = true;
    settings = {
      api_key_cmd = "${pkgs.pass-wayland}/bin/pass show openai/api-key";
    };
  };
}
