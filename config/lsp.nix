{
  plugins = {
    lsp-lines.enable = true;
    lsp-format.enable = true;
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        hls.enable = true;
        clangd.enable = true;
        openscad-lsp.enable = true;
        pylsp.enable = true;
        marksman.enable = true;
        nil-ls = {
          enable = true;
          settings.formatting.command = [ "nixfmt" ];
        };
      };
    };
  };
}
