{
  # Keymaps not directly related to specific plugins
  keymaps = [
    # Make
    {
      options.desc = "Run make";
      mode = "n";
      options.silent = true;
      key = "<leader>mm";
      action = "<cmd>make -j`nproc`<CR>";
    }
    {
      options.desc = "Run make clean";
      mode = "n";
      options.silent = true;
      key = "<leader>mc";
      action = "<cmd>make clean<CR>";
    }
    # Disable F15 ;)
    # https://nix-community.github.io/nixvim/user-guide/faq.html
    {
      options.desc = "F15 NOP";
      mode = [ "n" "i" "v" "s" "t" "x" "o" "!" "l" "c" ];
      options.silent = true;
      key = "<F15>";
      action = "<Nop>";
    }
    {
      options.desc = "Shift F15 NOP";
      mode = [ "n" "i" "v" "s" "t" "x" "o" "!" "l" "c" ];
      options.silent = true;
      key = "<S-F15>";
      action = "<Nop>";
    }
    {
      options.desc = "Control F15 NOP";
      mode = [ "n" "i" "v" "s" "t" "x" "o" "!" "l" "c" ];
      options.silent = true;
      key = "<C-F15>";
      action = "<Nop>";
    }
    {
      options.desc = "Alt F15 NOP";
      mode = [ "n" "i" "v" "s" "t" "x" "o" "!" "l" "c" ];
      options.silent = true;
      key = "<Alt-F15>";
      action = "<Nop>";
    }
    # Window management
    {
      options.desc = "Split window vertically";
      mode = "n";
      options.silent = true;
      key = "<leader>sv";
      action = "<C-w>v";
    }
    {
      options.desc = "Split window horizontally";
      mode = "n";
      options.silent = true;
      key = "<leader>sh";
      action = "<C-w>s";
    }
    {
      options.desc = "Close current split";
      mode = "n";
      options.silent = true;
      key = "<leader>sx";
      action = "<cmd>close<CR>";
    }
    {
      options.desc = "Toggle background transparency";
      mode = "n";
      options.silent = true;
      key = "<leader>cl";
      action = "<cmd>TransparentToggle<CR>";
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

}
