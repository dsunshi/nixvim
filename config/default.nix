{ _pkgs, lib, ... }:
let
  tabsize = 2;
  # columnsize = 120;
  # For this line to work the flake must add `--impure`
  # isWSL = if lib.filesystem.pathType /etc/wsl.conf == "symlink" then true else false;
in {

  imports = [
    # ./auto-sessions.nix
    ./bufferline.nix
    ./cmp.nix
    ./colorscheme.nix
    ./colorizer.nix
    ./fidget.nix
    ./gitsigns.nix
    ./haskell.nix
    ./icons.nix
    ./keymaps.nix
    ./lazygit.nix
    ./lsp.nix
    ./lualine.nix
    ./markdown.nix
    ./nvim-surround.nix
    ./oil.nix
    ./noice.nix
    ./otter.nix
    ./smartcolumn.nix
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

  clipboard = {
    register = "unnamedplus";
    providers.xclip.enable = true;
    providers.wl-copy.enable = true;
  };

  # extraConfigLua = #lua
  #   ''
  #     if vim.fn.has('wsl') == 1 then
  #         vim.g.clipboard = {
  #             name = 'WslClipboard',
  #             copy = {
  #                 ['+'] = 'clip.exe',
  #                 ['*'] = 'clip.exe',
  #             },
  #             paste = {
  #                 ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  #                 ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  #             },
  #             cache_enabled = 0,
  #         }
  #     end
  #   ''; 

  opts = {
    number = true;
    relativenumber = true;
    expandtab = true;
    showmatch = true;
    autoindent = true;
    shiftwidth = tabsize;
    tabstop = tabsize;
    # textwidth = columnsize;
    # colorcolumn = builtins.toString columnsize;
    ignorecase = true;
    smartcase = true;
    cursorline = true;
    signcolumn = "yes";
  };

  performance = {
    combinePlugins.enable = true;
    byteCompileLua.enable = true;
  };

}
