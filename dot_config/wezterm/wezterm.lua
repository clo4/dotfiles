local wezterm = require("wezterm")

local M = {}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	local title = wezterm.truncate_right(tab.active_pane.title, max_width - 3)
	if tab.is_active then
		foreground = "#83a598"
		return {
			{ Foreground = { Color = foreground } },
			{ Text = "▎ " },
			{ Foreground = { Color = "#dfbf8e" } },
			{ Text = title },
			{ Foreground = { Color = "#101010" } },
			{ Text = " ▕"}
		}
	else
		return {
			{ Text = "  " .. title },
			{ Foreground = { Color = "#101010" } },
			{ Text = " ▕"}
		}
	end
end)

M.window_padding = {
	left = "10pt",
	right = "10pt",
	top = "5pt",
	bottom = "5pt",
}
M.colors = {
	foreground = "#dfbf8e",
	background = "#282828",
	cursor_bg = "#D4BE98",
	cursor_border = "#D4BE98",
	cursor_fg = "#1D2021",
	selection_bg = "#D4BE98",
	selection_fg = "#3C3836",

	ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
	brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },

	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = "#202020",

		active_tab = {
			bg_color = "#282828",
			fg_color = "#dfbf8e",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#202020",
			fg_color = "#a89984",
		},
		inactive_tab_hover = {
			bg_color = "#2a2a2a",
			fg_color = "#dfbf8e",
			italic = false,
		},
		new_tab = {
			bg_color = "#202020",
			fg_color = "#a89984",
		},
		new_tab_hover = {
			bg_color = "#2a2a2a",
			fg_color = "#dfbf8e",
		},
	},
}
M.use_fancy_tab_bar = false
M.hide_tab_bar_if_only_one_tab = true
M.tab_max_width = 32
M.skip_close_confirmation_for_processes_named = {
	"bash",
	"bash (figterm)",
	"sh",
	"zsh",
	"zsh (figterm)",
	"fish",
	"fish (figterm)",
	"nu",
}
M.initial_rows = 40
M.initial_cols = 160
M.font = wezterm.font("JetBrains Mono")
M.mouse_bindings = {
	{
		event = { Down = { streak = 3, button = "Left" } },
		action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
		mods = "NONE",
	},
}

return M
