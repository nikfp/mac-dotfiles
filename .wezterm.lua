local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local theme = get_appearance()

if theme:find 'Dark' then
  config.color_scheme = "Kanagawa (Gogh)"
  config.window_background_opacity = 0.5
  config.macos_window_background_blur = 20
  config.set_environment_variables = {
    OS_THEME = "Dark"
  }
else
  config.color_scheme = "Tokyo Night Day"
  config.set_environment_variables = {
    OS_THEME = "Light"
  }
end

config.automatically_reload_config = true

config.font = wezterm.font 'CaskaydiaCove NF'
config.font_size = 16



config.keys = {
  {
    key = "j",
    mods = "CMD",
    action = wezterm.action.DisableDefaultAssignment
  },
  {
    key = "k",
    mods = "CMD",
    action = wezterm.action.DisableDefaultAssignment
  }
}

return config
