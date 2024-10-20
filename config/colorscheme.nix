{ pkgs, ... }: {
  # colorschemes.catppuccin.enable = true;
  # colorschemes.catppuccin.settings.flavour = "mocha";
  # colorschemes.catppuccin.settings.color_overrides.mocha = {
  #   yellow = "#eba0ac"; # Mocha maroon
  #   # green = "#94e2d5"; # Mocha teal
  #   green = "#fab387"; # Mocha peach
  # };
  colorscheme = "kanagawa-paper";
  extraPlugins = with pkgs;
    [
      (vimUtils.buildVimPlugin {
        name = "kanagawa-paper.nvim";
        src = fetchFromGitHub {
          owner = "sho-87";
          repo = "kanagawa-paper.nvim";
          rev = "40da69c1a6a92264cfc2aa9cc62ac9faa69e19dd"; # 1.6.0 release
          hash = "sha256-mq1Mn7ZrERmf4I2AR7GF3rWG6br5LrS8t1VnBqmjGco=";
        };
      })
    ];
}
