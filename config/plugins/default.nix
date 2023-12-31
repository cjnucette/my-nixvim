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
    statuscol-nvim
    neodev-nvim
    package-info-nvim
    clear-action-nvim
    lualine-lsp-progress
    maximize-nvim
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
