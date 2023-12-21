-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- disable yamlls on helm related files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*/templates/*.yaml,*/templates/*.tpl,*.gotmpl,helmfile*.yaml",
  callback = function()
    vim.opt_local.filetype = "helm"

    local is_helm_file_type = vim.bo.filetype == "helm"
    if is_helm_file_type then
      -- disable diagnostic
      vim.diagnostic.disable()

      -- stop yamlls client
      vim.lsp.stop_client(1, true)
    end
  end,
})
