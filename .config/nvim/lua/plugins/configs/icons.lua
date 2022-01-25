local present, icons = pcall(require, "nvim-web-devicons")
if not present then
   return
end

local colors = require("colors").get()

icons.setup {
   override = {
      c = {
         icon = "",
         color = colors.blue,
         name = "c",
      },
      css = {
         icon = "",
         color = colors.blue,
         name = "css",
      },
      deb = {
         icon = "",
         color = colors.magenta,
         name = "deb",
      },
      Dockerfile = {
         icon = "",
         color = colors.cyan,
         name = "Dockerfile",
      },
      html = {
         icon = "",
         color = colors.redwine,
         name = "html",
      },
      jpeg = {
         icon = "",
         color = colors.violet,
         name = "jpeg",
      },
      jpg = {
         icon = "",
         color = colors.violet,
         name = "jpg",
      },
      js = {
         icon = "",
         color = colors.brown,
         name = "js",
      },
      kt = {
         icon = "󱈙",
         color = colors.orange,
         name = "kt",
      },
      lock = {
         icon = "",
         color = colors.red,
         name = "lock",
      },
      lua = {
         icon = "",
         color = colors.blue,
         name = "lua",
      },
      mp3 = {
         icon = "",
         color = colors.grey,
         name = "mp3",
      },
      mp4 = {
         icon = "",
         color = colors.grey,
         name = "mp4",
      },
      out = {
         icon = "",
         color = colors.grey,
         name = "out",
      },
      png = {
         icon = "",
         color = colors.violet,
         name = "png",
      },
      py = {
         icon = "",
         color = colors.cyan,
         name = "py",
      },
      toml = {
         icon = "",
         color = colors.blue,
         name = "toml",
      },
      ts = {
         icon = "ﯤ",
         color = colors.teal,
         name = "ts",
      },
      rb = {
         icon = "",
         color = colors.magenta,
         name = "rb",
      },
      rpm = {
         icon = "",
         color = colors.orange,
         name = "rpm",
      },
      vue = {
         icon = "﵂",
         color = colors.green,
         name = "vue",
      },
      xz = {
         icon = "",
         color = colors.brown,
         name = "xz",
      },
      zip = {
         icon = "",
         color = colors.brown,
         name = "zip",
      },
   },
}
