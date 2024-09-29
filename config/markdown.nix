{ pkgs, ... }: {
  plugins.markdown-preview = { enable = true; };
  extraPlugins = with pkgs; [
    vimPlugins.vim-table-mode
    (vimUtils.buildVimPlugin {
      name = "render-markdown.nvim";
      src = fetchFromGitHub {
        owner = "MeanderingProgrammer";
        repo = "render-markdown.nvim";
        rev = "4bf3247dfd06844088768b37cf1976efef1bca26"; # 7.0.0 release
        hash = "sha256-U1/6FLCfAkAm692nqMl1qQh6Z1og/Gqoe3NZpa5py9g=";
      };
    })
  ];
}
