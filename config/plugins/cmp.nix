{
  config = {
    options.completeopt = ["menu" "menuone" "noinsert"];
    plugins = {
      luasnip.enable = true;
      lspkind.enable = true;

      nvim-cmp = {
        enable = true;

        snippet.expand = "luasnip";
		autoEnableSources = true;

        mapping = {
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-space>" = "cmp.mapping:complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = {
            modes = ["i" "s"];
            action = ''
              function(fallback)
                local has_words_before = function()
                  local unpack = unpack or table.unpack
                  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
                end

                local luasnip = require('luasnip')

                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif has_words_before() then
                  cmp.complete()
                else
                  fallback()
                end
              end
            '';
          };
          "<S-Tab>" = {
            modes = ["i" "s"];
            action = ''
              function(fallback)
                local luasnip = require('luasnip')

                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end
            '';
          };
        };

        sources = [
          {
            name = "nvim_lsp";
            priority = 1;
          }
          {
            name = "codeium";
            priority = 2;
          }
          {
            name = "nvim_lua";
            priority = 3;
          }
          {
            name = "luasnip";
            priority = 4;
          }
          {
            name = "buffer";
            priority = 4;
          }
          {name = "path";}
          {name = "emoji";}
        ];

        # window = {
        #   completion = "cmp.config.window.bordered()";
        #   documentation = "cmp.config.window.bordered()";
        # };
      };
    };
    # cmp-buffer.enable = true;
    # cmp-emoji.enable = true;
    # cmp-path.enable = true;
    # cmp-nvim-lsp.enable = true;
    # cmp-nvim-lua.enable = true;
    # cmp_luasnip.enable = true;
  };
}
