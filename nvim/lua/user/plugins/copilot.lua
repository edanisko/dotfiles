return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      enabled = true,
      suggestion = { enabled = true, auto_trigger = true },
      panel = { enabled = true },
    })
  end,
}
