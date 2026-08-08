return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = {
    { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason Management UI" },
  },
  opts = {
    ui = {
      border = "rounded",
    },
  },
}
