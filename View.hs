

{-# LANGUAGE OverloadedStrings #-}

module Main where

import Brick
import Brick.Widgets.List
import Brick.Widgets.Center
import Graphics.Vty.Attributes
import Graphics.Vty.Input.Events
import qualified Data.Vector as V

data AppState = AppState
    { appList :: List String
    }

drawUI :: AppState -> [Widget ()]
drawUI s = [center $ renderList listDrawElement True (appList s)]

listDrawElement :: Bool -> String -> Widget ()
listDrawElement sel a =
    if sel
    then withAttr customAttr $ str a
    else str a

customAttr :: AttrName
customAttr = "custom"

initialState :: AppState
initialState = AppState { appList = list () (V.fromList items) 1 }

items :: [String]
items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

appEvent :: AppState -> BrickEvent () e -> EventM () (Next AppState)
appEvent s (VtyEvent (EvKey (KChar 'q') [])) = halt s
appEvent s (VtyEvent (EvKey KDown [])) = continue $ s { appList = listMoveDown (appList s) }
appEvent s (VtyEvent (EvKey KUp [])) = continue $ s { appList = listMoveUp (appList s) }
appEvent s _ = continue s

theApp :: App AppState e ()
theApp = App
    { appDraw = drawUI
    , appChooseCursor = neverShowCursor
    , appHandleEvent = appEvent
    , appStartEvent = return
    , appAttrMap = const theMap
    }

theMap :: AttrMap
theMap = attrMap defAttr
    [ (customAttr, fg yellow) ]

main :: IO ()
main = do
    let buildVty = do
            v <- standardIOConfig
            mkVty v
    initialVty <- buildVty
    void $ customMain initialVty buildVty Nothing theApp initialState

