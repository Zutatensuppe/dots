import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

import XMonad.Layout.ResizableTile
import XMonad.Layout.SimpleFloat

import System.IO
import qualified Data.Map as M

mmask :: KeyMask
mmask = mod4Mask

main = do
    xmproc <- spawnPipe "/home/para/.cabal/bin/xmobar /home/para/.xmobarrc"
    xmonad $ defaultConfig
        { terminal = "gnome-terminal"
        , manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  defaultLayout
        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppSep    = "  "
                        , ppOrder  = \(ws:l:t:_) -> [ws, t]
                        , ppTitle  = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mmask 
        } `additionalKeys`
        [ ((mmask,   xK_o      ), spawn "chromium")
        , ((0, 0x1008ff12      ), spawn "amixer -q sset Master toggle")
        , ((0, 0x1008ff11      ), spawn "amixer -q sset Master 5%-")
        , ((0, 0x1008ff13      ), spawn "amixer -q sset Master 5%+")
        , ((mmask,   xK_h      ), sendMessage Shrink)
        , ((mmask,   xK_l      ), sendMessage Expand)
        , ((mmask,   xK_a      ), sendMessage MirrorShrink)
        , ((mmask,   xK_z      ), sendMessage MirrorExpand)
        , ((mmask,   xK_comma  ), sendMessage (IncMasterN 1))
        , ((mmask,   xK_period ), sendMessage (IncMasterN (-1)))
        ]

defaultLayout = avoidStruts $ tiled ||| Mirror tiled ||| Full ||| simpleFloat
  where
    tiled = ResizableTall 1 (2/100) (1/2) [] 
