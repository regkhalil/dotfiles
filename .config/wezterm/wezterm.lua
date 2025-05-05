local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()






-- set up the colour scheme
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Gruvbox Dark (Gogh)'
  else
    return 'Gruvbox (Gogh)'
  end
end

config.color_scheme = scheme_for_appearance(get_appearance())


-- set the font
config.font = wezterm.font 'Fira Code'


config.hide_tab_bar_if_only_one_tab = true

return config
