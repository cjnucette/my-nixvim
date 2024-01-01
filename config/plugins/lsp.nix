{
  config = {
    keymaps = [
      {
        mode = "n";
        key = "<F2>";
        action = "vim.lsp.buf.rename";
        lua = true;
        options = {
          desc = "LSP: [F2] rename";
        };
      }
      {
        mode = "n";
        key = "<F4>";
        action = "vim.lsp.buf.code_action";
        lua = true;
        options = {
          desc = "LSP: [F4] Show code actions";
        };
      }
      {
        mode = "n";
        key = "gd";
        action = "vim.lsp.buf.definition";
        lua = true;
        options = {
          desc = "LSP: [G]oto [D]efinition";
        };
      }
      {
        mode = "n";
        key = "gD";
        action = "vim.lsp.buf.definition";
        lua = true;
        options = {
          desc = "LSP: [G]oto [D]eclaration";
        };
      }
      {
        mode = "n";
        key = "gI";
        action = "vim.lsp.buf.implementation";
        lua = true;
        options = {
          desc = "LSP: [G]oto [I]mplementation";
        };
      }
      {
        mode = "n";
        key = "gt";
        action = "vim.lsp.buf.type_definition";
        lua = true;
        options = {
          desc = "LSP: [G]oto [T]ype Definition";
        };
      }
      {
        mode = "n";
        key = "<leader>ti";
        action = ''
          function()
            local toggle = not vim.lsp.inlay_hint.is_enabled()
            vim.lsp.inlay_hint.enable(nil, toggle)
          end
        '';
        lua = true;
        options = {
          desc = "LSP: [T]oggle [I]nlay hints";
        };
      }
      {
        mode = "n";
        key = "K";
        action = "vim.lsp.buf.hover";
        lua = true;
        options = {
          desc = "LSP: Hover documentation";
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "vim.lsp.buf.signature_help";
        lua = true;
        options = {
          desc = "LSP: Signature documentation";
        };
      }
      {
        mode = "n";
        key = "<leader>wa";
        action = "vim.lsp.buf.add_workspace_folder";
        lua = true;
        options = {
          desc = "LSP: [W]orkspace [A]add folder";
        };
      }
      {
        mode = "n";
        key = "<leader>wr";
        action = "vim.lsp.buf.remove_workspace_folder";
        lua = true;
        options = {
          desc = "LSP: [W]orkspace [R]emove folder";
        };
      }
      {
        mode = "n";
        key = "<leader>wl";
        action = ''
          function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end
        '';
        lua = true;
        options = {
          desc = "LSP: [W]orkspace [L]ist folders";
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
