version = "1.0.0"

xplr.config.general.read_only = true

xplr.config.general.table.header.cols = {
  { format = "", style = {} },
  { format = "╷", style = {} },
  { format = "   size   ", style = {} },
  { format = " modified ", style = {} },
}

xplr.config.general.table.row.cols = {
  {
    format = "builtin.fmt_general_table_row_cols_0",
    style = {},
  },
  {
    format = "builtin.fmt_general_table_row_cols_1",
    style = {},
  },
  {
    format = "builtin.fmt_general_table_row_cols_3",
    style = {},
  },
  {
    format = "builtin.fmt_general_table_row_cols_4",
    style = {},
  },
}

xplr.config.general.table.tree = {
  { format = "├", style = {} },
  { format = "├", style = {} },
  { format = "└", style = {} },
}

xplr.config.general.table.col_widths = {
  { Length = 7 },
  { Percentage = 50 },
  { Length = 10 },
  { Length = 10 },
}

xplr.config.general.focus_ui.prefix = ">["

xplr.config.general.focus_ui.suffix = "]"

xplr.config.general.panel_ui.default.borders = {}

xplr.config.general.panel_ui.default.border_type = "Plain"

xplr.config.layouts.builtin.default = {
  Horizontal = {
    config = {
      margin = 1,
      horizontal_margin = 1,
      vertical_margin = 0,
      constraints = {
        { Percentage = 100 },
      }
    },
    splits = {
      "Table",
    }
  }
}

-- Renders the index column
xplr.fn.builtin.fmt_general_table_row_cols_0 = function(m)
  local i = "" .. m.index
  if string.len(i) > 4 then
    return " " .. i
  else
    return string.rep(" ", 6 - string.len(i)) .. i
  end
end

-- Renders the datetime column
-- Currently shows passed time like "5m" or "10d"
xplr.fn.builtin.fmt_general_table_row_cols_4 = function(m)
  local diff = os.time() - math.floor(m.last_modified / 1000000000)

  if diff < 60 then
    return diff .. " s"
  elseif diff < 3600 then
    return math.floor(diff / 60) .. " m"
  elseif diff < 86400 then
    return math.floor(diff / 3600) .. " h"
  elseif diff < 2592000 then
    return math.floor(diff / 86400) .. " d"
  elseif diff < 31536000 then
    return math.floor(diff / 2592000) .. " mo"
  else
    return math.floor(diff / 31536000) .. " y"
  end
end
