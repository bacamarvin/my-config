

-- Cozy desktop: personal appearance overrides
hl.config({
    general = {
        gaps_in = 6,
        gaps_out = 10
    },
    decoration = {
        rounding = 18,
        blur = { enabled = true, size = 7, passes = 2, noise = 0.02 }
    }
})

-- Restrained motion shared with the desktop panels.
hl.animation({leaf = "windowsIn", enabled = true, speed = 2.2, bezier = "emphasizedDecel", style = "popin 96%"})
hl.animation({leaf = "windowsOut", enabled = true, speed = 1.8, bezier = "emphasizedDecel", style = "popin 97%"})
hl.animation({leaf = "workspaces", enabled = true, speed = 3, bezier = "emphasizedDecel", style = "slide"})
