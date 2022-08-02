local wezterm = require("wezterm")

return {
  exit_behavior = "Close",
  hide_tab_bar_if_only_one_tab = true,

  inactive_pane_hsb = {
    hue = 1.0,
    saturation = 0.6,
    brightness = 0.5,
  },
  font = wezterm.font("CaskaydiaCove Nerd Font"),
  font_size = 15.0,
  ssh_domains = {
    {
      name = "sanny",
      remote_address = "sanny.aawa.nl",
      username = "erwin",
    }
  },
  unix_domains = {
    {
      name = "unix",
    }
  },
  leader = { key="z", mods="CTRL" },
  keys = {
        -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
        { key = "-", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        { key = "|",mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },
        { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        { key = "h", mods = "SUPER",       action=wezterm.action{ActivatePaneDirection="Left"}},
        { key = "j", mods = "SUPER",       action=wezterm.action{ActivatePaneDirection="Down"}},
        { key = "k", mods = "SUPER",       action=wezterm.action{ActivatePaneDirection="Up"}},
        { key = "l", mods = "SUPER",       action=wezterm.action{ActivatePaneDirection="Right"}},
        { key = "H", mods = "SUPER", action=wezterm.action{AdjustPaneSize={"Left", 5}}},

        { key = "J", mods = "SUPER", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
        { key = "K", mods = "SUPER", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
        { key = "L", mods = "SUPER", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
        { key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
        { key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
        { key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
        { key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
        { key = "5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
        { key = "6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
        { key = "7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
        { key = "8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
        { key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
        { key = "&", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
        { key = "x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},

        { key = "n", mods="SHIFT|CTRL",     action="ToggleFullScreen" },
    },
}
