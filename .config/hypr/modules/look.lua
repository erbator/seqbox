-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
local rumda = require("modules.rumda_state")
local look, vibranceShader = rumda.look, rumda.vibranceShader

hl.config({
    general = {
        gaps_in  = look.gaps_in + (look.ring or 0),
        gaps_out = {
            top    = 45 + (look.ring or 0),
            right  = 40 + (look.ring or 0),
            bottom = 45 + (look.ring or 0),
            left   = 40 + (look.ring or 0),
        },

        border_size = look.border_size,

        col = {
            active_border   = look.border,
            inactive_border = look.border,
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        screen_shader  = vibranceShader,
        rounding       = look.rounding,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 0.99,

        shadow = {
            enabled        = true,
            range          = look.shadow_range,
            render_power   = look.shadow_power,
            offset         = look.shadow_offset,
            color          = look.shadow,
            color_inactive = look.shadow_inactive,
            sharp          = look.shadow_sharp or false,
        },

        blur = {
            enabled   = look.blur,
            size      = 1,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})
