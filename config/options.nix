{
  config = {
    options = {
      number = true;
      signcolumn = "number";
      mouse = "a";

      modeline = true;
      updatetime = 200;
      autoread = true;
      autowrite = true;
      exrc = true;

      expandtab = false;
      tabstop = 4;
      softtabstop = -1;
      shiftwidth = 0;

      splitright = true;
      splitbelow = true;
      splitkeep = "screen";

      # statusline
      cmdheight = 0;
      laststatus = 3;
      showmode = false;

      cursorline = true;
      confirm = true;
      wrap = false;
      breakindent = true;
      ignorecase = false;
      smartcase = true;
      incsearch = true;
      hlsearch = false;
      list = true;
      listchars = {
        tab = "  ";
        trail = "·";
      };
      fillchars = {eob = " ";};
      undodir = "/home/cjnucette/.config/nvim/.undodir";
      undofile = true;
      undolevels = 10000;
      wildmode = "longest:full,full";
    };
  };
}
