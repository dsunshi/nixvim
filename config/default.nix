{ pkgs, ... }: {
  colorschemes.catppuccin.enable = true;
  colorschemes.catppuccin.settings.flavour = "mocha";
  colorschemes.catppuccin.settings.color_overrides.mocha = {
    yellow = "#eba0ac"; # Mocha maroon
    green = "#94e2d5"; # Mocha teal
  };
  

  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./which-key.nix
  ];

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
    # Haskell
    {
      options.desc = "Toggle GHCi repl for the current buffer";
      mode = "n";
      options.silent = true;
      key = "<leader>rr";
      action.__raw = "require('haskell-tools').repl.toggle";
    }
    {
      options.desc = "Hoogle search for the type signature of the definition under the cursor";
      mode = "n";
      options.silent = true;
      key = "<leader>hs";
      action.__raw = "require('haskell-tools').hoogle.hoogle_signature";
    }
    # codeLenses
    {
      options.desc = "Run codeLenses";
      mode = "n";
      options.silent = true;
      key = "<leader>cl";
      action.__raw = "vim.lsp.codelens.run";
    }
    # Oil
    {
      options.desc = "Open parent directory";
      mode = "n";
      options.silent = true;
      key = "-";
      action = "<cmd>Oil<cr>";
    }
    # Disable F15
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
    expandtab = true;
    showmatch = true;
    shiftwidth = 4;
    tabstop = 4;
    textwidth = 120;
    colorcolumn = "120";
  };

  plugins = {
    telescope = { enable = true; };
    gitsigns.enable = true;
    oil.enable = true;
    lualine = {
      enable = true;
      settings.options = {
        icons_enabled = false;
        section_separators.left = "";
        section_separators.right = "";
        component_separators.left = "|";
        component_separators.right = "|";
      };
    };
    trouble.enable = true;
    toggleterm.enable = true;
    treesitter = {
      enable = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
        ensure_installed = "all";
      };
    };
    lsp = {
      enable = true;
      servers = {
        hls.enable = true;
        clangd.enable = true;
        nil-ls = {
          enable = true;
          settings.formatting.command = [ "nixfmt" ];
        };
      };
    };
    cmp = {
      enable = true;
      settings = {
        sources = [
          {
            name = "spell";
          }
          # { name = "async_path"; }
          # { name = "fish"; }
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          {
            name = "treesitter";
          }
          # { name = "snippy"; }
          { name = "luasnip"; }
        ];

        # Tab style snippet mapping, where by default nothing
        # is selected. Tab cycles through completions, while
        # automatically applying them, however snippets require
        # enter to expand.
        snippet.expand =
          "function(args) require'luasnip'.lsp_expand(args.body); end";
        mapping = {
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-Space>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                if require("luasnip").expandable_or_jumpable() then
                  require("luasnip").expand_or_jump()
                else
                  cmp.confirm({
                      select = true,
                      behavior = cmp.ConfirmBehavior.Insert
                  })
                end
              else
                fallback()
              end
            end)'';
          "<Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require("luasnip").locally_jumpable(1) then
                require("luasnip").jump(1)
              else
                fallback()
              end
            end, { "i", "s" })'';

          "<S-Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").locally_jumpable(-1) then
                require("luasnip").jump(-1)
              else
                fallback()
              end
            end, { "i", "s" })'';
        };
      };
    };
    luasnip.enable = true; # for cmp - does not auto enable
  };

  extraPlugins = with pkgs; [
    vimPlugins.haskell-tools-nvim
    vimPlugins.nvim-dap
    (vimUtils.buildVimPlugin {
        name = "render-markdown.nvim";
        src = fetchFromGitHub {
            owner = "MeanderingProgrammer";
            repo = "render-markdown.nvim";
            rev = "4bf3247dfd06844088768b37cf1976efef1bca26"; # 7.0.0 release
            hash = "sha256-U1/6FLCfAkAm692nqMl1qQh6Z1og/Gqoe3NZpa5py9g=";
        };})
  ];

  performance = {
    combinePlugins.enable = true;
    byteCompileLua.enable = true;
  };

}
