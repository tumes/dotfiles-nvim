require "nvchad.options"

local o = vim.o
o.wrap = false

-- Replace curly quotes and smart punctuation on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local replacements = {
      ["\u{2018}"] = "'", -- left single curly quote
      ["\u{2019}"] = "'", -- right single curly quote
      ["\u{201C}"] = '"', -- left double curly quote
      ["\u{201D}"] = '"', -- right double curly quote
      ["\u{2013}"] = "-", -- en dash
      ["\u{2014}"] = "--", -- em dash
      ["\u{2026}"] = "...", -- ellipsis
    }
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local changed = false
    for i, line in ipairs(lines) do
      local new_line = line
      for from, to in pairs(replacements) do
        new_line = new_line:gsub(from, to)
      end
      if new_line ~= line then
        lines[i] = new_line
        changed = true
      end
    end
    if changed then
      vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
      vim.notify("Replaced smart punctuation", vim.log.levels.WARN)
    end
  end,
})
