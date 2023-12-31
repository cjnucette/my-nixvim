{
  config = {
    options = {
      foldcolumn = "1";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<space><space>";
        action = "za";
        options.desc = "UFO: Toggle fold";
      }
      {
        mode = "n";
        key = "zR";
        action = "function() require('ufo').openAllFolds() end";
        lua = true;
        options.desc = "UFO: Unfold all";
      }
      {
        mode = "n";
        key = "zM";
        action = "function() require('ufo').closeAllFolds() end";
        lua = true;
        options.desc = "UFO: fold all";
      }
      {
        mode = "n";
        key = "zK";
        action = "function() require('ufo').peekFoldedLinesUnderCursor() end";
        lua = true;
        options.desc = "UFO: Peek lines in fold";
      }
    ];

    plugins.nvim-ufo = {
      enable = true;
      foldVirtTextHandler = ''
        function(virttext, lnum, endlnum, width, truncate)
          local newvirttext = {}
          local suffix = ('  %d '):format(endlnum - lnum)
          local sufwidth = vim.fn.strdisplaywidth(suffix)
          local targetwidth = width - sufwidth
          local curwidth = 0
          for _, chunk in ipairs(virttext) do
            local chunktext = chunk[1]
            local chunkwidth = vim.fn.strdisplaywidth(chunktext)
            if targetwidth > curwidth + chunkwidth then
              table.insert(newvirttext, chunk)
            else
              chunktext = truncate(chunktext, targetwidth - curwidth)
              local hlgroup = chunk[2]
              table.insert(newvirttext, { chunktext, hlgroup })
              chunkwidth = vim.fn.strdisplaywidth(chunktext)
              -- str width returned from truncate() may less than 2nd argument, need padding
              if curwidth + chunkwidth < targetwidth then
                suffix = suffix .. (' '):rep(targetwidth - curwidth - chunkwidth)
              end
              break
            end
            curwidth = curwidth + chunkwidth
          end
          table.insert(newvirttext, { suffix, 'moremsg' })
          return newvirttext
        end
      '';
      providerSelector = ''
        function(_, _, _)
          return { 'lsp', 'indent'}
        end
      '';
    };
  };
}
