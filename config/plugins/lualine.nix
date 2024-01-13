let
  main_color = "Statusline";

  section_colors = {
    a = main_color;
    b = main_color;
    c = main_color;
    x = main_color;
    y = main_color;
    z = main_color;
  };

  mono_theme = {
    normal = section_colors;
    insert = section_colors;
    visual = section_colors;
    replace = section_colors;
    command = section_colors;
    inactive = section_colors;
  };
in {
  plugins.lualine = {
    enable = true;

    globalstatus = true;
    componentSeparators = {
      left = "";
      right = "";
    };
    sectionSeparators = {
      left = "";
      right = "";
    };
    disabledFiletypes = {
      statusline = null;
      winbar = null;
    };

    theme = mono_theme;

    # extensions = ["lualine-lsp-progress"];

    sections = {
      lualine_a = [
        "diagnostics"
      ];
      lualine_b = ["mode" "branch" "diff"];
      lualine_c = [
        {
          name.__raw = ''
            function()
              return require("package-info").get_status()
            end
          '';
        }

        {
          name.__raw = ''
                   function()
                     local client_names = vim.lsp.get_active_clients({ bufnr = 0 })
            local names = ""

            for _, name in ipair(client_names) do
             names = names .. " " .. name
            end

                     return names
                   end
          '';
          # icon = " ";
          # color.fg = "#ffffff";
        }

        {
          name = "lsp_progress";
          extraConfig = {
            separators = {
              lsp_client_name = {
                pre = "";
                post = "";
              };
            };
            hide = ["null-ls" "emmet_language_server" "eslint"];
            spinner_symbols = ["✶" "✸" "✹" "✺" "✹" "✸" "✷"];
            display_components = ["spinner"];
            timer = {
              lsp_client_name_enddelay = 0;
            };
          };
        }
      ];

      lualine_x = [
        {
          name.__raw = ''
            function()
			  local status = vim.fn["codeium#GetStatusString"]()

			  if status == ' ON' then
				  return '󱃖'
			  elseif status == 'OFF' then
				  return '⦸'
			  end

			  return status
            end
          '';
        }
        {
          name.__raw = ''
            function()
              return vim.t.maximized and " " or ""
            end
          '';
        }
        {
          name.__raw = ''
            function()
            return 'Ln %l,Col %c'
            end
          '';
        }
      ];
      lualine_y = ["filetype"];
      lualine_z = [
        {
          name.__raw = ''
            function()
             return os.date('%I:%M %p')
            end
          '';
        }
      ];
    };
    extensions = ["quickfix" "man" "fugitive" "neo-tree" "oil" "toggleterm"];
  };
}
