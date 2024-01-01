{self, ...}: {
  # defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  luaLoader.enable = true;

  colorschemes.catppuccin.enable = true;
  clipboard.register = ["unnamedplus" "unnamed"];

  extraConfigLua = ''
    require('nixvim') -- ~/.config/nvim/lua/nixvim
    vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
    vim.opt.nrformats:append({ 'alpha' })
    vim.opt.fillchars:append({ foldclose = '', foldopen = '›' })
  '';

  imports = [
    ./options.nix
    ./keymaps.nix
    ./autocmds.nix
    ./plugins
  ];
}
