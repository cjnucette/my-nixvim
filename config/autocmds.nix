{
  autoGroups.user_cmds.clear = true;
  autoCmd = [
    {
      desc = "Use q to close the window";
      group = "user_cmds";
      event = "FileType";
      pattern = ["help" "man" "fugitive" "qf" "notify" "lspinfo" "checkhealth" "git" "oil"];
      command = "nnoremap <buffer> q :quit<cr>";
    }
    {
      desc = "Highlight yanked objects";
      group = "user_cmds";
      event = "TextYankPost";
      callback = {__raw = "function() vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 }) end";};
    }
    {
      desc = "Place the cursor on the last place you where in a file and center buffer around it";
      group = "user_cmds";
      event = "BufRead";
      callback = {
        __raw = ''
          function()
              local mark = vim.api.nvim_buf_get_mark(0, '"')
              local lcount = vim.api.nvim_buf_line_count(0)
              if mark[1] > 0 and mark[1] <= lcount then
                if pcall(vim.api.nvim_win_set_cursor, 0, mark) then
                  vim.cmd.normal('zz')
                end
              end
            end
        '';
      };
    }
    {
      event = ["BufWinLeave" "BufWritePost" "WinLeave"];
      desc = "Save view with mkview for real files";
      group = "user_cmds";
      callback = {
        __raw = ''
          function(args)
              if vim.b[args.buf].view_activated then vim.cmd.mkview { mods = { emsg_silent = true } } end
          end
        '';
      };
    }
    {
      event = "BufWinEnter";
      desc = "Try to load file view if available and enable view saving for real files";
      group = "user_cmds";
      callback = {
        __raw = ''
          function(args)
              if not vim.b[args.buf].view_activated then
                local filetype = vim.api.nvim_get_option_value('filetype', { buf = args.buf })
                local buftype = vim.api.nvim_get_option_value('buftype', { buf = args.buf })
                local ignore_filetypes = { 'gitcommit', 'gitrebase', 'svg', 'hgcommit' }
                if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
                  vim.b[args.buf].view_activated = true
                  vim.cmd.loadview { mods = { emsg_silent = true } }
                end
              end
          end
        '';
      };
    }
  ];
}
