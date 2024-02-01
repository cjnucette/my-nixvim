let
  opts = {
    silent = true;
    noremap = true;
  };
in {
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  keymaps = [
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = opts;
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = opts;
    }
    {
      mode = "n";
      key = "<tab>";
      action = "<cmd>bn<cr>";
      options = opts;
    }
    {
      mode = "n";
      key = "<s-tab>";
      action = "<cmd>bp<cr>";
      options = opts;
    }
    {
      mode = "n";
      key = "-";
      action = "<cmd>Oil --float<cr>";
      options = opts;
    }
    {
      mode = "n";
      key = "<leader>w";
      action = "vim.cmd.w";
      lua = true;
      options = opts // {desc = "Save buffer";};
    }
    {
      mode = "n";
      key = "<leader>u";
      action = "gUawel";
      options = opts // {desc = "Toggle capitalization of word under the cursor";};
    }
    {
      mode = "n";
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        silent = true;
        expr = true;
      };
    }
    {
      mode = "n";
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        silent = true;
        expr = true;
      };
    }
    {
      mode = "v";
      key = "<a-j>";
      action = ":m '>+1<CR>gv=gv";
      options = opts // {desc = "Move current line up, keeping indentation and selection";};
    }
    {
      mode = "v";
      key = "<a-k>";
      action = ":m '<-2<CR>gv=gv";
      options = opts // {desc = "Move current line up, keeping indentation and selection";};
    }
    {
      mode = "n";
      key = "<a-j>";
      action = ":m .+1<CR>==";
      options = opts // {desc = "Move current line down keeping indentation";};
    }
    {
      mode = "n";
      key = "<a-k>";
      action = ":m .-2<CR>==";
      options = opts // {desc = "Move current line up keeping indentation";};
    }
    {
      mode = "n";
      key = "<F1>";
      action = ":help <C-r><C-w><CR>";
      options = opts // {desc = "Find help for the word under the cursor";};
    }
  ];
}
