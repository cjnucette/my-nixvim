{self, ...}: {
  # defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  luaLoader.enable = true;

  colorschemes.catppuccin = {
    enable = true;
    flavour = "macchiato";
  };
  clipboard.register = ["unnamedplus" "unnamed"];

  extraConfigLua = ''
    vim.opt.shortmess:append({ W = true, c = true, C = true })
    vim.opt.nrformats:append({ 'alpha' })
    vim.opt.fillchars:append({ foldclose = '', foldopen = '›' })

    -- codeium
    vim.g.codeium_filetypes = {
      markdown = false,
      text = false,
    }

    -- statuscol
    local builtin = require('statuscol.builtin')
    require('statuscol').setup({
      relculright = true,
      segments = {
        { text = { ' ', builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
        { sign = { name = { 'Diagnostic' }, maxwidth = 2, auto = true }, click = 'v:lua.ScSa' },
        { sign = { name = { '.*' }, maxwidth = 2, colwidth = 1, auto = true }, click = 'v:lua.ScSa' },
      }
    })
  '';

  imports = [
    ./options.nix
    ./keymaps.nix
    ./autocmds.nix
    ./plugins
  ];
}
