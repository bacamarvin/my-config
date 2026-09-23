

-- Frosted floating panels. Shadows stay transparent; panel interiors receive blur.
for _, namespace in ipairs({"quickshell:bar", "quickshell:sidebarLeft", "quickshell:sidebarRight", "quickshell:mediaControls", "quickshell:desktopSummary", "quickshell:dock", "quickshell:popup"}) do
    hl.layer_rule({ match = { namespace = namespace }, blur = true, ignore_alpha = 0.2 })
end
