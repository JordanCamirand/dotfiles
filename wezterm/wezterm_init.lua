-- Pull in the wezterm API
--
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Ayu Dark (Gogh)"
config.hide_tab_bar_if_only_one_tab = true
config.use_dead_keys = false

config.tab_max_width = 40
config.font_size = 16.0
config.font = wezterm.font("JetBrains Mono")
config.window_decorations = "RESIZE"

config.window_padding = {
	left = 0,
	right = 0,
	top = 10,
	bottom = 0,
}

config.keys = {
	-- Prompt for a name to use for a new workspace and switch to it.
	-- and allow activating one.
	{
		key = "w",
		mods = "ALT",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
	-- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
	{
		key = "LeftArrow",
		mods = "OPT",
		action = act.SendKey({
			key = "b",
			mods = "ALT",
		}),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = act.SendKey({ key = "f", mods = "ALT" }),
	},
	-- Explicitly reload the configuration.
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
}

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

-- and finally, return the configuration to wezterm
return config
