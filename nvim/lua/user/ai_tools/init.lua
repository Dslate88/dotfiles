local M = {}

M.config = require("user.ai_tools.config")
M.utils = require("user.ai_tools.utils")
M.logger = require("user.ai_tools.logger")

-- Optional: expose scripts registry for convenience
M.scripts = require("user.ai_tools.scripts")

return M
