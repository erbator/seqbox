-- rumda shell + scripts
local mainMod = require("modules.programs").mainMod
local rumdaScripts = "~/.config/rumda/scripts/"
hl.bind(mainMod .. " + TAB",         hl.dsp.exec_cmd("echo toggle > /tmp/qs-dashboard.fifo"))
hl.bind(mainMod .. " + Z",           hl.dsp.exec_cmd(rumdaScripts .. "zoom_toggle.sh"))
hl.bind(mainMod .. " + W",           hl.dsp.exec_cmd(rumdaScripts .. "wallcycle.sh"))     -- next wallpaper for this mode
hl.bind("Print",                     hl.dsp.exec_cmd(rumdaScripts .. "qscreen.sh"))      -- region to clipboard
hl.bind(mainMod .. " + Print",       hl.dsp.exec_cmd(rumdaScripts .. "screenshot.sh"))   -- region into swappy
hl.bind(mainMod .. " + SHIFT + T",   hl.dsp.exec_cmd(rumdaScripts .. "ocr.sh"))
hl.bind(mainMod .. " + SHIFT + R",   hl.dsp.exec_cmd(rumdaScripts .. "screenrec.sh"))
hl.bind(mainMod .. " + ALT + R",     hl.dsp.exec_cmd(rumdaScripts .. "screenrec.sh region"))
