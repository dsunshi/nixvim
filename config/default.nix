{
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  keymaps = [
    # telescope
    {
      options.desc = "Find files";
      mode = "n";
      options.silent = true;
      key = "<leader>ff";
      action = ":Telescope find_files<cr>";
    }
  ];

  colorschemes.gruvbox.enable = true;

  plugins = {
    telescope = {
      enable = true;
    };
  };
}
