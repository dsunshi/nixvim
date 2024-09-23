{ pkgs, ... }:
let
  tabsize = 2;
  columnsize = 120;
in {

  imports = [
    ./auto-sessions.nix
    ./bufferline.nix
    ./cmp.nix
    ./colorscheme.nix
    ./fidget.nix
    ./gitsigns.nix
    ./haskell.nix
    ./icons.nix
    ./keymaps.nix
    ./lazygit.nix
    ./lsp.nix
    ./lualine.nix
    ./oil.nix
    ./startup.nix
    ./telescope.nix
    ./toggleterm.nix
    ./treesitter.nix
    ./trouble.nix
    ./which-key.nix
  ];

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  localOpts = { number = true; };

  opts = {
    relativenumber = true;
    expandtab = true;
    showmatch = true;
    autoindent = true;
    shiftwidth = tabsize;
    tabstop = tabsize;
    textwidth = columnsize;
    colorcolumn = builtins.toString columnsize;
    ignorecase = true;
    smartcase = true;
    cursorline = true;
    signcolumn = "yes";
  };

  extraPlugins = with pkgs;
    [
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

  performance = {
    combinePlugins.enable = true;
    byteCompileLua.enable = true;
  };

}
