hl.on("hyprland.start", function () 
   hl.exec_cmd("~/IX-config/qof/pywal16 &")
   hl.exec_cmd("brightnessctl set 100%")
   hl.exec_cmd(notes)
   hl.exec_cmd("nm-applet")
   hl.exec_cmd("librewolf")
   hl.exec_cmd("hyprsunset")
-- hl.exec_cmd(clock, clock_wr)
   hl.exec_cmd("awww-daemon &")
   hl.exec_cmd("otd-daemon")
   hl.exec_cmd("hyprctl setcursor Braun 24")
   hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
   hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

 end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "26")
hl.env("HYPRCURSOR_SIZE", "26")
-----------------------
----- PERMISSIONS -----
-----------------------
-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

 hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
 hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
 hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


