-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 14
config.color_scheme = 'AdventureTime'
--config.color_scheme = 'matrix'
--config.color_scheme = 'Matrix (terminal.sexy)'

--config.font = wezterm.font('JetBrains Mono', { weight = 'Bold' })
config.font = wezterm.font_with_fallback({
  -- Adjust to your primary terminal font (Must be a Nerd Font variant)
  { family = 'JetBrains Mono', weight = 'Regular' }, 
  
  -- Explicit math and layout symbols fallback
  { family = 'Symbols Nerd Font Mono' },
})

-- Finally, return the configuration to wezterm:
return config
