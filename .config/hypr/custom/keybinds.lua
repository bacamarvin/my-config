hl.bind("CTRL+SUPER+ALT+Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), {description = "Edit user keybinds"} )

-- Reference desktop: individually toggle floating panels.
hl.bind("SUPER + ALT + D", hl.dsp.global("quickshell:desktopSummaryToggle"), {description = "Panel: Calendario"})
hl.bind("SUPER + ALT + B", hl.dsp.global("quickshell:dockToggle"), {description = "Panel: Dock"})
hl.bind("SUPER + ALT + P", hl.dsp.global("quickshell:referencePanelsToggle"), {description = "Paneles: Mostrar u ocultar todos"})
