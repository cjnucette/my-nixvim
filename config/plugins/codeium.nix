{
  keymaps = [
    {
      mode = "i";
      key = "<C-g>";
      action = "codeium#Accept()";
      options = {
        silent = true;
        expr = true;
        desc = "Codeium: Accept";
      };
    }
    {
      mode = "i";
      key = "<C-j>";
      action = "codeium#CycleCompletions(1)";
      options = {
        silent = true;
        expr = true;
        desc = "Codeium: Next completion";
      };
    }
    {
      mode = "i";
      key = "<C-k>";
      action = "codeium#CycleCompletions(-1)";
      options = {
        silent = true;
        expr = true;
        desc = "Codeium: Prev completion";
      };
    }
    {
      mode = "i";
      key = "<C-x>";
      action = "codeium#Clear']()";
      options = {
        silent = true;
        expr = true;
        desc = "Codeium: Clear";
      };
    }
  ];
  plugins.codeium-vim = {
    enable = true;
    disableBindings = true;
  };
}
