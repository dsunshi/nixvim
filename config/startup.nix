{
  plugins.startup = {
    enable = true;

    colors = {
      background = "#ffffff";
      foldedSection = "#ffffff";
    };

    sections = {
      header = {
        type = "text";
        oldfilesDirectory = false;
        align = "center";
        foldSection = false;
        title = "Header";
        margin = 5;
        content = [
          "    ..                                                             ,,                        ..     "
          "  pd'      (Ob.                           `7MN.   `7MF'            db                         `bq   "
          " 6P           M                             MMN.    M                                           YA  "
          "6M'           db    `7M'   `MF'             M YMb   M `7M'   `MF'`7MM  `7MMpMMMb.pMMMb.         `Mb "
          "MN           AMA.     `VA ,V'               M  `MN. M   VA   ,V    MM    MM    MM    MM          8M "
          "MN          AM'`M       XMX                 M   `MM.M    VA ,V     MM    MM    MM    MM          8M "
          "YM.        ,M'  db    ,V' VA.      ,,       M     YMM     VVV      MM    MM    MM    MM         ,M9 "
          " Mb       JM'    Yb..AM.   .MA.    db     .JML.    YM      W     .JMML..JMML  JMML  JMML.       dM  "
          "  Yq.                                                                                         .pY   "
          "    ``                                                                                       ''     "
        ];
        highlight = "Statement";
        defaultColor = "";
        oldfilesAmount = 0;
      };

      body = {
        type = "mapping";
        oldfilesDirectory = false;
        align = "center";
        foldSection = false;
        title = "Menu";
        margin = 5;
        content = [
          [ " Find File" "Telescope find_files" "ff" ]
          [ "󰍉 Find Word" "Telescope live_grep" "fr" ]
          [ " Recent Files" "Telescope oldfiles" "fg" ]
          [ " File Browser" "Telescope file_browser" "fe" ]
        ];
        highlight = "string";
        defaultColor = "";
        oldfilesAmount = 0;
      };
    };

    options = { paddings = [ 1 3 ]; };

    parts = [ "header" "body" ];
  };
}

