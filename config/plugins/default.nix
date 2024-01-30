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
    ./codeium.nix
  ];

  extraPlugins = with pkgs.vimPlugins; [
    promise-async
    lualine-lsp-progress
    statuscol-nvim
    {
      plugin = neodev-nvim;
      config = ''lua require('neodev').setup() '';
    }
    {
      plugin = package-info-nvim;
      config = ''lua require('package-info').setup() '';
    }
    {
      plugin = clear-action-nvim;
      config = ''lua require('clear-action').setup() '';
    }
    {
      plugin = maximize-nvim;
      # this sets a default mapping <leader>z
      config = ''lua require('maximize').setup() '';
    }
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
    # fugitive.enable = true;
    neogit.enable = true;

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
    # codeium-vim.enable = true;
  };
}
