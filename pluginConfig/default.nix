self:
(builtins.concatStringsSep "\n")
(
  map (x: "luafile ${x}")
  [
    ./airline.lua
    ./barbecue.lua
    ./bufferline.lua
    ./coc.lua
    ./gitsigns.lua
    ./init.lua
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
    "let coc_config_home = '${self}/pluginConfig'"
    (builtins.readFile ./context.vim)
  ]
)
