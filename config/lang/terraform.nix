{
  plugins = {
    lsp.servers = {
      terraformls.enable = true;
      tflint.enable = true;
    };
    none-ls.sources.formatting.terraform_fmt.enable = true;
  };
}
