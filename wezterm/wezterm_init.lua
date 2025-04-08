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

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

config.keys = {
	-- Prompt for a name to use for a new workspace and switch to it.
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
}

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

config.keys = {
	-- Switch to the default workspace

	-- Show the launcher in fuzzy selection mode and have it list all workspaces
	-- and allow activating one.
	{
		key = "w",
		mods = "ALT",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
}

-- and finally, return the configuration to wezterm
return config
