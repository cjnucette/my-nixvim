{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bufferline.nix
    ./lualine.nix
    ./neotree.nix
    ./telescope.nix
    ./toggleterm.nix
    ./ufo.nix
    ./noice.nix
    ./lsp.nix
    ./conform.nix
    ./cmp.nix
  ];

  extraPlugins = with pkgs.vimPlugins; [
    promise-async
    lualine-lsp-progress
    {
      plugin = statuscol-nvim;
      config = ''
        require('statuscol').setup()
      '';
    }
    {
      plugin = neodev-nvim;
      config = ''
        require('neodev').setup()
      '';
    }
    {
      plugin = package-info-nvim;
      config = ''
        local pi = require('package-info')
        pi.setup()

        vim.keymap.set('n', '<leader>ps', pi.show, { silent = true, noremap = true, desc = "Package-info: Show dependencies version"})
        vim.keymap.set('n', '<leader>ph', pi.hide, { silent = true, noremap = true, desc = "Package-info: Hide dependencies version"})
        vim.keymap.set('n', '<leader>ph', pi.toggle, { silent = true, noremap = true, desc = "Package-info: Toggle dependencies version"})
        vim.keymap.set('n', '<leader>ph', pi.update, { silent = true, noremap = true, desc = "Package-info: Update dependency current line "})
        vim.keymap.set('n', '<leader>ph', pi.delete, { silent = true, noremap = true, desc = "Package-info: Delete dependency current line "})
        vim.keymap.set('n', '<leader>ph', pi.install, { silent = true, noremap = true, desc = "Package-info: Install dependency a new dependency"})
        vim.keymap.set('n', '<leader>ph', pi.change_version, { silent = true, noremap = true, desc = "Package-info: Install a different version of the dependency"})
      '';
    }
    {
      plugin = clear-action-nvim;
      config = ''
        require('clear-action').setup()
      '';
    }
    {
      plugin = maximize-nvim;
      # this sets a default mapping <leader>z
      config = ''
        require('maximize').setup()
      '';
    }
    ai-nvim
  ];

  plugins = {
    treesitter = {
      enable = true;
      indent = true;
    };
    ts-context-commentstring.enable = true;
    ts-autotag.enable = true;

    barbecue.enable = true;
    todo-comments.enable = true;
    gitsigns.enable = true;
    fugitive.enable = true;

    oil.enable = true;

    which-key.enable = true;
    mini = {
      enable = true;
      modules = {
        indentscope = {
          symbol = "│";
          options = {try_as_border = true;};
        };
        surround = {};
        comment = {};
        pairs = {};
      };
    };

    markdown-preview.enable = true;
    crates-nvim.enable = true;
  };
}
