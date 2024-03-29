-- local status_ok, plugin = pcall(require, 'nvim-treesitter.configs')
--
-- if not status_ok then
--   vim.notify('Error loading user/treesitter.lua\n\n' .. plugin)
--   return
-- end
--
-- plugin.setup {
--   rainbow = {
--     enable = true,
--     extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
--     max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
--   },
--   ensure_installed = {'ruby', 'yaml', 'json'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--   ignore_install = { 'javascript' }, -- List of parsers to ignore installing
--   highlight = {
--     enable = true,             -- false will disable the whole extension
--     disable = { 'c', 'rust' }  -- list of language that will be disabled
--   },
--   indent = {
--     enable = true
--   },
-- }
