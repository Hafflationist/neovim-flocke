self:
(builtins.concatStringsSep "\n")
(
  map (x: "luafile ${x}")
  [
    ./airline.lua
#    ./barbecue.lua
    ./bufferline.lua
    ./cmp.lua
    ./gitsigns.lua
    ./init.lua
    ./lsp.lua
#    ./lspconfig.lua
    ./lualine.lua
    ./navbuddy.lua
    ./neoscroll.lua
    ./nightfox-nvim.lua
    ./noice.lua
    ./notify.lua
    ./scrollbar.lua
    ./telescope.lua
    ./tree.lua
  ]
  ++
  [
    (builtins.readFile ./context.vim)
  ]
)
