{pkgs, ...} :
{
  colorschemes.kanagawa.enable = true;

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

  keymapsOnEvents = {
    TermOpen = [
      {
        options.desc = "ESC to normal mode";
        mode = "t";
	key = "<esc>";
	action = ''<C-\><C-n>'';
      }
    ];
  };

  localOpts = {
    number = true;
  };

  opts = {
    expandtab = true;
    showmatch = true;
    shiftwidth = 4;
    tabstop = 4;
    textwidth = 120;
    # colorcolumn = 120; # TODO: nixvim wants a number, and neovim wants a string
  };

  plugins = {
    telescope = {
      enable = true;
    };
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
          settings.formatting.command = ["nixfmt"];
        };
      };
    };
      cmp = {
      enable = true;
      settings = {
        sources = [
          { name = "spell"; }
          # { name = "async_path"; }
          # { name = "fish"; }
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          { name = "treesitter"; }
          # { name = "snippy"; }
          { name = "luasnip"; }
        ];

        # Tab style snippet mapping, where by default nothing
        # is selected. Tab cycles through completions, while
        # automatically applying them, however snippets require
        # enter to expand.
        snippet.expand = ''function(args) require'luasnip'.lsp_expand(args.body); end'';
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
  ];
}
