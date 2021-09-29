import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig
import XMonad.Util.Run

myManageHook = composeAll
    [ (className =? "Microsoft Teams - Preview"
    <&&> stringProperty "WM_NAME" =? "Microsoft Teams Notification") --> doFloat ]

main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar"
  _ <- spawnPipe "compton"
  _ <- spawnPipe "gromit-mpx"
  _ <- spawnPipe "nitrogen --restore"
  _ <- spawnPipe "nm-tray"
  _ <- spawnPipe "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 6 --transparent true --tint 0x000000 --height 20"

  xmonad $ docks desktopConfig
    { handleEventHook = fullscreenEventHook <+> handleEventHook desktopConfig
    , terminal = "xterm"
    , modMask = mod4Mask
    , layoutHook = smartBorders $ avoidStruts $ layoutHook def
    , manageHook = myManageHook <+> manageHook def
    , logHook = dynamicLogWithPP xmobarPP
    {
      ppOutput = hPutStrLn xmproc
    , ppTitle = xmobarColor "green" "" . shorten 50
    }
    , workspaces = ["1:DEV", "2:WEB", "3:COM", "4:TEST", "5:CONF"]
        ++ take 3 [ show x ++ ":OTHR" | x <- [6..]]
    }
    `additionalKeysP`
    [ ("M-S-f", spawn "firefox" )
    , ("M-S-e", spawn "emacs" )
    , ("M-S-t", spawn "teams" )
    , ("M-s", spawn "systemctl suspend" )
    , ("M-g", sendMessage ToggleStruts )
    ]
