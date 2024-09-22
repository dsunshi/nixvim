{
  plugins.lsp = {
    enable = true;
    servers = {
      hls.enable = true;
      clangd.enable = true;
      nil-ls = {
        enable = true;
        settings.formatting.command = [ "nixfmt" ];
      };
    };
  };
}
