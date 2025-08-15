return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    
    local git_blame = require("gitblame")

local colors = {
	base = "#232136",
	surface = "#2a273f",
	overlay = "#393552",
	muted = "#6e6a86",
	subtle = "#908caa",
	text = "#e0def4",
	love = "#eb6f92",
	gold = "#f6c177",
	rose = "#ea9a97",
	pine = "#3e8fb0",
	foam = "#9ccfd8",
	iris = "#c4a7e7",
	highlight_low = "#2a283e",
	highlight_med = "#44415a",
	highlight_high = "#56526e",
}

local theme = {
	normal = {
		a = { fg = colors.base, bg = colors.pine },
		b = { fg = colors.text, bg = colors.surface },
		c = { fg = colors.text, bg = colors.base },
		z = { fg = colors.base, bg = colors.iris },
	},
	insert = {
		a = { fg = colors.base, bg = colors.foam },
		z = { fg = colors.base, bg = colors.foam },
	},
	visual = {
		a = { fg = colors.base, bg = colors.iris },
		z = { fg = colors.base, bg = colors.iris },
	},
	replace = {
		a = { fg = colors.base, bg = colors.love },
		z = { fg = colors.base, bg = colors.love },
	},
	inactive = {
		a = { fg = colors.muted, bg = colors.base },
		b = { fg = colors.muted, bg = colors.base },
		c = { fg = colors.muted, bg = colors.base },
		z = { fg = colors.muted, bg = colors.base },
	},
}

local empty = require("lualine.component"):extend()
function empty:draw(default_highlight)
	self.status = ""
	self.applied_separator = ""
	self:apply_highlights(default_highlight)
	self:apply_section_separators()
	return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
	for name, section in pairs(sections) do
		local left = name:sub(9, 10) < "x"
		for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
			table.insert(section, pos * 2, { empty, color = { fg = colors.base, bg = colors.base } })
		end
		for id, comp in ipairs(section) do
			if type(comp) ~= "table" then
				comp = { comp }
				section[id] = comp
			end
			comp.separator = left and { right = "" } or { left = "" }
		end
	end
	return sections
end

local function search_result()
	if vim.v.hlsearch == 0 then
		return ""
	end
	local last_search = vim.fn.getreg("/")
	if not last_search or last_search == "" then
		return ""
	end
	local searchcount = vim.fn.searchcount({ maxcount = 9999 })
	return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

local function modified()
	if vim.bo.modified then
		return "+"
	elseif vim.bo.modifiable == false or vim.bo.readonly == true then
		return "-"
	end
	return ""
end

require("lualine").setup({
	options = {
		theme = theme,
		component_separators = "",
		section_separators = { left = "", right = "" },
	},
	sections = process_sections({
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				source = { "nvim" },
				sections = { "error" },
				diagnostics_color = { error = { bg = colors.love, fg = colors.base } },
			},
			{
				"diagnostics",
				source = { "nvim" },
				sections = { "warn" },
				diagnostics_color = { warn = { bg = colors.gold, fg = colors.base } },
			},
			{ "filename", file_status = false, path = 1 },
			{ modified, color = { bg = colors.rose } },
			{
				"%w",
				cond = function()
					return vim.wo.previewwindow
				end,
			},
			{
				"%r",
				cond = function()
					return vim.bo.readonly
				end,
			},
			{
				"%q",
				cond = function()
					return vim.bo.buftype == "quickfix"
				end,
			},
		},
		lualine_c = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
		lualine_x = {},
		lualine_y = { search_result, "filetype" },
		lualine_z = { "%l:%c", "%p%%/%L" },
	}),
	inactive_sections = {
		lualine_c = { "%f %y %m" },
		lualine_x = {},
	},
})
end

}
