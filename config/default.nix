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

    -- specter
    require('spectre').setup({
      result_padding = ' ',
      default = {
        replace = {
          cmd = 'sed'
        },
      },
    })
    vim.keymap.set('n', '<leader>A', function() require("spectre").toggle() end, { noremap = true, silent = true, desc = "Spectre: Toggle Spectre" })
    vim.keymap.set('n', '<leader>aw', function() require("spectre").open_visual({ select_word = true}) end, { noremap = true, silent = true, desc = "Spectre: Search current word" })
    vim.keymap.set('v', '<leader>aw', function() require("spectre").open_visual() end, { noremap = true, silent = true, desc = "Spectre: Search selected word" })
    vim.keymap.set('n', '<leader>af', function() require("spectre").open_file_search({ select_word = true}) end, { noremap = true, silent = true, desc = "Spectre: Search current file" })
  '';

  imports = [
    ./options.nix
    ./keymaps.nix
    ./autocmds.nix
    ./plugins
  ];
}
