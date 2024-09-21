local marked = require("harpoon.mark")

local M = {}

function M.get_marked_files()
	local files = {}

	for idx = 1, marked.get_length() do
		local filename = marked.get_marked_file_name(idx)
		if filename ~= "" then
			table.insert(files, { filename = filename })
		end
	end

	return files
end

return M
