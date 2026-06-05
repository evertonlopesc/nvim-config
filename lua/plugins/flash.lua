return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>fs", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Teletransportar Cursor" },
  },
}
