{
  keymaps = [
    {
      mode = "i";
      key = "<C-g>";
      action = "function() return vim.fn['codeium#Accept']() end";
      options = {
        silent = true;
        expr = true;
        desc = "Codeium: Accept";
      };
    }
    {
      mode = "i";
      key = "<C-j>";
      action = "function() return vim.fn['codeium#CycleCompletions'](1) end";
      options = {
        silent = true;
        expr = true;
        desc = "Codeium: Next completion";
      };
    }
    {
      mode = "i";
      key = "<C-k>";
      action = "function() return vim.fn['codeium#CycleCompletions'](-1) end";
      options = {
        silent = true;
        expr = true;
        desc = "Codeium: Prev completion";
      };
    }
    {
      mode = "i";
      key = "<C-x>";
      action = "function() return vim.fn['codeium#Clear']() end";
      options = {
        silent = true;
        expr = true;
        desc = "Codeium: Clear";
      };
    }
  ];
  # plugins.codeium-vim = {
  #   enable = true;
  # };
}
