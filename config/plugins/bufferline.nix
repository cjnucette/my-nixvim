{
  plugins.bufferline = {
    enable = true;
    # view = "multiwindow";
    numbers = "ordinal";
    leftTruncMarker = "";
    rightTruncMarker = "";
    modifiedIcon = "*";
    diagnostics = "nvim_lsp";
    alwaysShowBufferline = true;
    separatorStyle = "slant";
    diagnosticsIndicator = ''
      function(_, _, diag)
        local s = {}
        local severities = {
          'error',
          'warning'
        }
        signs = {
          error = "",
          warning = ""
        }
        for _, severity in ipairs(severities) do
          if diag[severity] then
            table.insert(s, signs[severity] .. ' ' .. diag[severity])
          end
        end
        return table.concat(s, ' ')
      end
    '';
    offsets = [
      {
        filetype = "neo-tree";
        text = "explorer";
        textAligh = "center";
      }
    ];
  };
}
