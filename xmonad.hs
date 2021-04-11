-- Imports
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run          -- spawnPipe and hPutStrLn

-- Configuration overrides
myBar = "xmobar $HOME/.xmobar/xmobarrc" -- bar launch command
myBorderWidth = 2                       -- window border width
myFocusedBorderColor = "#2c89db"        -- border colour for focussed window
myModMask = mod4Mask                    -- set mod key to win/super
myNormalBorderColor = "#282c34"         -- border colour for normal windows
myTerminal = "alacritty"

-- Main function
main = do
    xmproc <- spawnPipe myBar

    xmonad $ docks def
        { terminal = myTerminal
        , modMask = myModMask
        , borderWidth = myBorderWidth
        , focusedBorderColor = myFocusedBorderColor
        , layoutHook = avoidStruts $ layoutHook def
        , logHook = dynamicLogWithPP xmobarPP { ppOutput = hPutStrLn xmproc }
        , normalBorderColor = myNormalBorderColor
        }

