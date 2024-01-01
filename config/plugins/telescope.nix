{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
    };

    keymaps = {
      # Find files using Telescope command-line sugar.
      "<leader>sf" = "find_files";
      "<leader>sg" = "live_grep";
      "<leader>sb" = "buffers";
      "<leader>sh" = "help_tags";
      "<leader>sd" = "diagnostics";
      "<leader>sk" = "keymaps";
      "<leader>sw" = "grep_string";

      # FZF like bindings
      "<C-p>" = "git_files";
      "<leader>p" = "oldfiles";
      "<C-f>" = "live_grep";
    };

    keymapsSilent = true;

    defaults = {
      file_ignore_patterns = [
        "^.git/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
        "%.ipynb"
        "node_modules"
      ];
      set_env.COLORTERM = "truecolor";
    };
  };
}
