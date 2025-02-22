{
  pkgs,
  lib,
  ...
}:
{
  plugins.chatgpt = {
    enable = true;
    settings = {
      api_key_cmd = "${pkgs.pass-wayland}/bin/pass show openai/api-key";
    };
  };

  imports = with builtins; with lib;
    map (fn: ./${fn})
      (filter
        (fn: (
          fn != "default.nix"
          && !hasSuffix ".md" "${fn}"
        ))
        (attrNames (readDir ./.)));
}
