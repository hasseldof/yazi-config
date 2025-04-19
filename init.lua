require("relative-motions"):setup({ show_numbers="relative", show_motion = true, enter_mode ="first" })

require("full-border"):setup({
  type = ui.Border.PLAIN,
})

require("eza-preview"):setup({
  -- Determines the directory depth level to tree preview (default: 3)
  level = 3,

  -- Whether to follow symlinks when previewing directories (default: false)
  follow_symlinks = false,

  -- Whether to show target file info instead of symlink info (default: false)
  dereference = false,
})

-- custom linemode
function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	elseif os.date("%Y", time) == os.date("%Y") then
		time = os.date("%b %d %H:%M", time)
	else
		time = os.date("%b %d  %Y", time)
	end

	local size = self._file:size()
	return string.format("%s %s", size and ya.readable_size(size) or "-", time)

end

local catppuccin_theme = require("yatline-catppuccin"):setup("frappe") -- or "latte" | "frappe" | "macchiato" | "mocha"
require("yatline"):setup({
	theme = catppuccin_theme,	

	total = { icon = "", fg = "#eed49f" },
	succ = { icon = "", fg = "#a6da95" },
	fail = { icon = "", fg = "#ed8796" },
	found = { icon = "", fg = "#8aadf4" },
	processed = { icon = "", fg = "#a6da95" },

	header_line = {
		left = {
			section_a = {
				{ type = "line", custom = false, name = "tabs", params = { "left" } },
			},
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = {
				{ type = "string", custom = false, name = "date", params = { "%a, %x" } },
			},
			section_b = {
				{ type = "string", custom = false, name = "date", params = { "%X" } },
			},
			section_c = {},
		},
	},

	status_line = {
		left = {
			section_a = {
				{ type = "string", custom = false, name = "tab_mode" },
			},
			section_b = {
				{ type = "string", custom = false, name = "hovered_size" },
			},
			section_c = {
				{ type = "string", custom = false, name = "tab_path" },
				{ type = "coloreds", custom = false, name = "count" },
			},
		},
		right = {
			section_a = {
				{ type = "string", custom = false, name = "cursor_position" },
			},
			section_b = {
				{ type = "string", custom = false, name = "cursor_percentage" },
			},
			section_c = {
				{ type = "string", custom = false, name = "hovered_file_extension", params = { true } },
				{ type = "coloreds", custom = false, name = "permissions" },
			},
		},
	},
})
