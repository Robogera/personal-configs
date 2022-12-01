local wezterm = require 'wezterm'
return {
  window_close_confirmation = 'NeverPrompt',
  check_for_updates = true,
  automatically_reload_config = true,
  exit_behavior = 'Close',
  color_scheme = 'Catppuccin Macchiato',
  font = wezterm.font_with_fallback {
    'CaskaydiaCove NF',
    'Cascadia Code PL'
  },
  font_size = 16.0,
  adjust_window_size_when_changing_font_size = false,
  default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe' },
  window_decorations = "NONE",

--  window_frame = {
--    font = wezterm.font { 'FiraCode NF' },
--    font_size = 10,
--  },

  use_fancy_tab_bar = false,
  colors = {
    tab_bar = {
      background = '#13151f',

      active_tab = {
        bg_color = '#24273a',
        fg_color = '#cad3d6',
        italic = true,
      },
      inactive_tab = {
        bg_color = '#191C29',
        fg_color = '#cad3d6',
        italic = false,
      },
    },
  },
}

