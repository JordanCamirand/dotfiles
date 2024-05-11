-- Example file to copy to ~/.wezterm.lua
local config = require("/Users/jordan/code/personal/dotfiles/wezterm/wezterm_init")

local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	-- see ex: https://wezfurlong.org/wezterm/config/lua/gui-events/gui-startup.html

	local projects = {
		"projectA",
		"projectB",
	}

	for _, project in pairs(projects) do
		mux.spawn_window({
			workspace = project,
			cwd = "Users/jordan/code/" .. project .. "/",
		})
	end

	-- We want to startup in the coding workspace
	mux.set_active_workspace("projectB")
end)

return config
