{
    plugins.toggleterm = {
      enable = true;

      size = ''
        function(term)
          if term.direction == 'horizontal' then
            return vim.o.lines * 0.5
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          end
        end
      '';

      openMapping = "<c-t>";
      direction = "float";
      hideNumbers = true;
      shadeTerminals = true;
      startInInsert = true;
      insertMappings = true;
      persistSize = true;
      closeOnExit = true;
      floatOpts = {
        border = "curved";
        height = 20;
        winblend = 3;
        # highlights = {
        #   border = "Normal";
        #   background = "Normal";
        # };
      };
    };
}
