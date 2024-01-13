{self, ...}: {
  # defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  luaLoader.enable = true;

  colorschemes.catppuccin.enable = true;
  clipboard.register = ["unnamedplus" "unnamed"];

  extraConfigLua = ''
      vim.opt.shortmess:append({ W = true, c = true, C = true })
      vim.opt.nrformats:append({ 'alpha' })
      vim.opt.fillchars:append({ foldclose = '', foldopen = '›' })
      vim.g.codeium_filetypes = {
    markdown = false,
      	text = false,
      }
  '';

  imports = [
    ./options.nix
    ./keymaps.nix
    ./autocmds.nix
    ./plugins
  ];
}
