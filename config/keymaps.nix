{
  # Keymaps not directly related to specific plugins
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
      mode = [ "n" "i" "v" "s" "t" "x" "o" "!" "l" "c" ];
      options.silent = true;
      key = "<F15>";
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