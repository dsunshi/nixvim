{ pkgs, ... }: {

  # Import all your configuration modules here
  imports = [
    ./colorscheme.nix
    ./bufferline.nix
    ./cmp.nix
    ./gitsigns.nix
    ./haskell.nix
    ./icons.nix
    ./lsp.nix
    ./lualine.nix
    ./oil.nix
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

  keymaps = [
    # codeLenses
    {
      options.desc = "Run codeLenses";
      mode = "n";
      options.silent = true;
      key = "<leader>cl";
      action.__raw = "vim.lsp.codelens.run";
    }
    # Disable F15 ;)
    {
      options.desc = "NOP";
      mode = "n";
      options.silent = true;
      key = "<F15>";
      action = "<Nop>";
    }
    {
      options.desc = "NOP";
      mode = "i";
      options.silent = true;
      key = "<F15>";
      action = "<Nop>";
    }
  ];

  keymapsOnEvents = {
    TermOpen = [{
      options.desc = "ESC to normal mode";
      mode = "t";
      key = "<esc>";
      action = "<C-\\><C-n>";
    }];
  };

  localOpts = { number = true; };

  opts = {
    relativenumber = true;
    expandtab = true;
    showmatch = true;
    autoident = true;
    shiftwidth = 4;
    tabstop = 4;
    textwidth = 120;
    colorcolumn = "120";
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
