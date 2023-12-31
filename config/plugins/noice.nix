{
    keymaps = [
      {
        mode = "c";
        key = "<s-enter>";
        action = "function() require('noice').redirect(vim.fn.getcmdline()) end";
        lua = true;
        options.desc = "Noice: Redirect command";
      }
      {
        mode = "n";
        key = "<leader>nl";
        action = "function() require('noice').cmd('last') end";
        lua = true;
        options.desc = "Noice: Show last message";
      }
      {
        mode = "n";
        key = "<leader>nh";
        action = "function() require('noice').cmd('history') end";
        lua = true;
        options.desc = "Noice: Show history";
      }
      {
        mode = "n";
        key = "<leader>na";
        action = "function() require('noice').cmd('all') end";
        lua = true;
        options.desc = "Noice: Show all messages";
      }
      {
        mode = "n";
        key = "<c-f>";
        action = "function() if not require('noice.lsp').scroll(4) then return '<c-f>' end end";
        lua = true;
        options = {
          silent = true;
          expr = true;
          desc = "Noice: Scroll forward";
        };
      }
      {
        mode = "n";
        key = "<c-b>";
        action = "function() if not require('noice.lsp').scroll(-4) then return '<c-b>' end end";
        lua = true;
        options = {
          silent = true;
          expr = true;
          desc = "Noice: Scroll backward";
        };
      }
    ];

    plugins = {
      notify.enable = true;

      noice = {
        enable = true;

        lsp = {
          progress = {enabled = true;};
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
        };
        presets = {
          bottom_search = true;
          command_palette = true;
          long_message_to_split = true;
          inc_rename = false;
          lsp_doc_border = false;
        };
      };
    };
}
