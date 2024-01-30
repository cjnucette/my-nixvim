{
  config = {
    autoGroups.lsp_cmds.clear = true;

    autoCmd = [
      {
        desc = "Set lsp keymaps when a lsp is attached";
        group = "lsp_cmds";
        event = "LspAttach";
        callback = {
          __raw = ''
            function(ev)
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                local map = function(mode, lhs, rhs, options)
                  -- Buffer local mappings.
                  local opts = vim.tbl_deep_extend('force', { buffer = ev.buf }, options)
                  vim.keymap.set(mode, lhs, rhs, opts)
                end

                -- See `:help vim.lsp.*` for documentation on any of the below functions
                if client.supports_method("textDocument/hover") then
                    map('n', 'K', vim.lsp.buf.hover, { desc = "LSP: Show documentation on hover" })
                end
                map('n', 'gD', vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration"})
                map('n', 'gd', vim.lsp.buf.definition, { desc = "LSP: [G]oto [d]efinition"})
                map('n', 'gI', vim.lsp.buf.implementation, { desc = "LSP: [G]oto [i]mplementation"})
                map('n', 'gt', vim.lsp.buf.type_definition, { desc = "LSP: [G]oto [t]ype definition"})
                map('n', 'gr', vim.lsp.buf.references, { desc = "LSP: [G]oto [R]eference"})
                map('n', 'gs', vim.diagnostic.open_float, { desc = "LSP: Show diagnostics" })
                map('n', '<F2>', vim.lsp.buf.rename, { desc = "LSP: Rename symbol under the cursor"})
                map({ 'n', 'v' }, '<F4>', vim.lsp.buf.code_action, { desc = "LSP: Show code actions"})
                map('n', '<C-k>', vim.lsp.buf.signature_help, { desc = "LSP: Show signature"})
                map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = "LSP: [W]orkspace [a]dd" })
                map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { desc = "LSP: [W]orkspace [r]emove"})
                map('n', '<space>wl', function()
                  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, { desc = "LSP: [W]orkspace [l]ist"})
                map('n', '<leader>ti', function()
                  local toggle = not vim.lsp.inlay_hint.is_enabled()
                  vim.lsp.inlay_hint.enable(nil, toggle)
                end, { desc = "LSP: [T]oggle [I]nlay hints" })
              end'';
        };
      }
    ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          bashls.enable = true;
          rust-analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          nixd.enable = true;
          lua-ls.enable = true;
          tsserver.enable = true;
          cssls.enable = true;
          html.enable = true;
          eslint.enable = true;
          jsonls.enable = true;
          astro.enable = true;
          ltex.enable = true;
        };
      };
    };
  };
}
