{
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle float<CR>";
        options = {
          silent = true;
          desc = "Neotree: Open floating neo-tree window";
        };
      }
      {
        mode = "n";
        key = "<leader>ef";
        action = "<cmd>Neotree toggle float<CR>";
        options = {
          silent = true;
          desc = "Neotree: Open floating neo-tree window";
        };
      }
      {
        mode = "n";
        key = "<leader>er";
        action = "<cmd>Neotree toggle right<CR>";
        options = {
          silent = true;
          desc = "Neotree: Open neo-tree at the right";
        };
      }
      {
        mode = "n";
        key = "<leader>el";
        action = "<cmd>Neotree toggle left<CR>";
        options = {
          silent = true;
          desc = "Neotree: Open neo-tree at the left";
        };
      }
    ];

    plugins.neo-tree = {
      enable = true;
      closeIfLastWindow = true;
      popupBorderStyle = "rounded";
      # followCurrentFile = true;
      enableGitStatus = true;
      enableDiagnostics = true;
      sourceSelector = {
        winbar = true;
        sources = [
          {source = "filesystem";}
          {source = "git_status";}
          {source = "buffers";}
        ];
        contentLayout = "start";
        tabsLayout = "start";
      };
      defaultComponentConfigs = {
        gitStatus = {
          symbols = {
            added = "+";
            deleted = "-";
            modified = "~";
            renamed = "";
            untracked = "?";
            ignored = "";
            unstaged = "";
            staged = "";
            conflict = "";
          };
          align = "right";
        };
        diagnostics = {
          symbols = {
            error = "";
            warn = "";
            info = "";
            hint = "";
          };
        };
      };
      window = {
        width = 30;
        position = "float";
        popup = {
          size = {
            height = "70%";
            width = "50%";
          };
        };
        mappings = {
          "l" = "open";
          "h" = "close_node";
        };
      };
      filesystem = {
        bindToCwd = true;
        useLibuvFileWatcher = true;
      };
    };
}
