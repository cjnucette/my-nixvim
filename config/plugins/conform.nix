{
  config = {
    keymaps = [
      {
        key = "<leader>f";
        action = "function() conform.format({ timeout_ms = 500, lsp_fallback = true, async = true, }) end";
        mode = ["n" "v"];
        lua = true;
        options = {
          silent = true;
          noremap = true;
          "desc" = "Conform: [F]ormat current buffer";
        };
      }
      {
        key = "<leader>fs";
        action = "function() conform.format({ timeout_ms = 500, lsp_fallback = true, async = true, }); vim.cmd.w() end";
        mode = ["n" "v"];
        lua = true;
        options = {
          silent = true;
          noremap = true;
          "desc" = "Conform: [F]ormat and [S]ave current buffer";
        };
      }
    ];

    plugins.conform-nvim = {
      enable = true;

      formattersByFt = {
        html = ["prettier"];
        css = ["prettier"];
        astro = ["prettier"];
        json = ["prettier"];
        javascript = ["prettier"];
        typescript = ["prettier"];
        javascriptreact = ["prettier"];
        typescriptreact = ["prettier"];
        sh = ["shfmt"];
        nix = ["alejandra"];
      };

      formatOnSave = {
        timeoutMs = 500;
        lspFallback = true;
      };
    };
  };
}
