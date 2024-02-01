{
  config = {
    keymaps = [
      {
        key = "<leader>gp";
        mode = "n";
        action = "function() require('gitsigns').preview_hunk() end";
        lua = true;
        options = {
          silent = true;
          noremap = true;
          desc = "Gitsigns: [G]it [P]review hunk";
        };
      }
      {
        key = "<leader>gb";
        mode = "n";
        action = "function() require('gitsigns').blame_line() end";
        lua = true;
        options = {
          silent = true;
          noremap = true;
          desc = "Gitsigns: [G]it [B]lame line";
        };
      }
      {
        key = "<leader>gg";
        mode = "n";
        action = "function() require('neogit').open({ kind = 'split'}) end";
        lua = true;
        options = {
          silent = true;
          noremap = true;
          desc = "Neogit: [G]it [G]it";
        };
      }
    ];

    plugins = {
      gitsigns = {
        enable = true;
        signs = {
          add.text = "+";
          change.text = "~";
          changedelete.text = "␡";
          delete.text = "-";
          topdelete.text = "‾";
          untracked.text = "?";
        };
      };
      neogit = {
        enable = true;
        autoRefresh = true;
      };
    };
  };
}
