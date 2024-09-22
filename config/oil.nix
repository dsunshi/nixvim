{
  keymaps = [{
    options.desc = "Open parent directory";
    mode = "n";
    options.silent = true;
    key = "-";
    action = "<cmd>Oil<cr>";
  }];

  plugins.oil = { enable = true; };
}
