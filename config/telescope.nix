{
  keymaps = [
    {
      options.desc = "Find files";
      mode = "n";
      options.silent = true;
      key = "<leader>ff";
      action = ":Telescope find_files<cr>";
    }
    {
      options.desc = "Find by grep";
      mode = "n";
      options.silent = true;
      key = "<leader>fg";
      action = ":Telescope live_grep<cr>";
    }
    {
      options.desc = "Find buffer";
      mode = "n";
      options.silent = true;
      key = "<leader><space>";
      action = ":Telescope buffers<cr>";
    }
  ];

  LspAttach = [
    {
      key = "<leader>Lr";
      action.__raw = "require('telescope.builtin').lsp_references";
      options.desc = "View references";
    }
    {
      key = "<leader>Ls";
      action.__raw = "require('telescope.builtin').lsp_document_symbols";
      options.desc = "View document symbols";
    }
    {
      key = "<leader>LS";
      action.__raw = "require('telescope.builtin').lsp_workspace_symbols";
      options.desc = "View workspace symbols";
    }
  ];

  plugins.telescope = {
    enable = true;
    extensions = {
      fzy-native = {
        enable = true;
        settings = {
          override_generic_sorter = true;
          override_file_sorter = false;
        };
      };
      media-files.enable = true;
      ui-select.enable = true;
      frecency.enable = true;
      file-browser = {
        enable = true;
        settings.hijack_netrw = true;
      };
    };
  };
}
