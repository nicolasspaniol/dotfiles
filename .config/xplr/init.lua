version = "1.0.0"

xplr.config.general.read_only = true

xplr.config.general.table.header.cols = {
  { format = "", style = {} },
  { format = "╷", style = {} },
  { format = "size", style = {} },
  { format = "modified", style = {} },
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
  { Percentage = 10 },
  { Length = 16 },
}

xplr.config.general.focus_ui.prefix = ">["

xplr.config.general.focus_ui.suffix = "]"

xplr.config.general.panel_ui.default.borders = {
  "Top",
  "Right",
  "Bottom",
  "Left",
}

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
xplr.fn.builtin.fmt_general_table_row_cols_4 = function(m)
  return tostring(os.date("%d-%m-%Y %H:%M", m.last_modified / 1000000000))
end
