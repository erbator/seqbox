--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- utilities + file manager open as centered floating windows
hl.window_rule({
    name  = "float-utilities",
    match = { class = "^(pavucontrol|org\\.pulseaudio\\.pavucontrol|blueman-manager|nm-connection-editor|qt6ct|qt5ct|nwg-look|xdg-desktop-portal-gtk|file-roller|org\\.gnome\\.FileRoller|imv|swappy|hyprsysteminfo|org\\.gnome\\.Loupe|thunar|Thunar)$" },
    float = true, center = true, size = { "monitor_w*0.6", "monitor_h*0.65" },
})
hl.window_rule({ name = "float-dialogs", match = { title = "^(Open File|Open Folder|Save As|Save File|Select Folder|File Upload|Choose Files|Preferences|Library|Picture in picture)$" }, float = true, center = true })

-- rofi pops in with blur behind it
hl.layer_rule({ match = { namespace = "^(rofi)$" }, blur = true, ignore_alpha = 0.3, animation = "popin 90%" })
