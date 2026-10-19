-- rumda flavour + light/dark, written by ~/.config/rumda/scripts/{flavour,theme}.sh
local function readState(name, default)
    local f = io.open(os.getenv("HOME") .. "/.cache/rumda-" .. name)
    local value = f and f:read("l") or default
    if f then f:close() end
    return value
end
local rumdaFlavour = readState("flavour", "main")
local rumdaTheme   = readState("theme", "light")

-- digital vibrance shader, written by ~/.config/rumda/scripts/vibrance.sh
local vibrance = tonumber(readState("vibrance", "0")) or 0
local vibranceShader = os.getenv("HOME") .. "/.cache/rumda-vibrance-" .. vibrance .. ".frag"
local shaderFile = vibrance > 0 and io.open(vibranceShader)
if shaderFile then shaderFile:close() else vibranceShader = "" end

local mainLook = {
    gaps_in = 9, border_size = 3, rounding = 7, blur = true,
    shadow_range = 7, shadow_power = 9, shadow_offset = { 5, 4 },
}
local pixelLook = {
    gaps_in = 9, border_size = 1, rounding = 1, blur = false,
    border = "rgba(90664aff)", shadow = 0xcc784d37, shadow_inactive = 0xcc784d37,
    shadow_range = 1, shadow_power = 12, shadow_offset = { 9, 9 },
}
local rumdaLooks = {
    main = {
        light = { border = "rgba(f2bc88ff)", shadow = 0xaa784d37, shadow_inactive = 0xaa784d37 },
        dark  = { border = "rgba(784d37ff)", shadow = 0xcc7b5541, shadow_inactive = 0xcb7b5541 },
    },
    pixel = {
        light = {},
        -- solid 13px dark ring around a 3px border (the rice uses borders-plus-plus for this)
        dark  = {
            rounding = 0, border_size = 3, border = "rgba(784d37ff)",
            gaps_in = 4, ring = 13, -- ring is added to the gaps so it does not cover them
            shadow = 0xff1c1612, shadow_inactive = 0xff1c1612,
            shadow_range = 13, shadow_offset = { 0, 0 }, shadow_sharp = true,
        },
    },
    warm = {
        light = {
            gaps_in = 10, border_size = 4, rounding = 7, blur = false,
            border = "rgba(f0bb90ff)", shadow = 0xaa784d37, shadow_inactive = 0xaa784d37,
            shadow_range = 3, shadow_power = 9, shadow_offset = { 5, 5 },
        },
    },
}
local flavourLooks = rumdaLooks[rumdaFlavour] or rumdaLooks.main
local look = {}
for k, v in pairs(rumdaFlavour == "pixel" and pixelLook or mainLook) do look[k] = v end
for k, v in pairs(flavourLooks[rumdaTheme] or flavourLooks.light) do look[k] = v end

return {
    flavour        = rumdaFlavour,
    theme          = rumdaTheme,
    look           = look,
    vibranceShader = vibranceShader,
}
