clearFromCursorToLineBeginning :: IO ()
clearFromCursorToLineEnd :: IO ()
clearFromCursorToScreenBeginning :: IO ()
clearFromCursorToScreenEnd :: IO ()
clearLine :: IO ()
clearScreen :: IO ()
cursorBackward :: Int -> IO ()
cursorDown :: Int -> IO ()
cursorDownLine :: Int -> IO ()
cursorForward :: Int -> IO ()
cursorPosition :: Text.ParserCombinators.ReadP.ReadP (Int, Int)
cursorUp :: Int -> IO ()
cursorUpLine :: Int -> IO ()
getCursorPosition :: IO (Maybe (Int, Int))
getLayerColor ::
  ConsoleLayer
  -> IO (Maybe (colour-2.3.6:Data.Colour.RGB.RGB GHC.Word.Word16))
getReportedCursorPosition :: IO String
getReportedLayerColor :: ConsoleLayer -> IO String
getTerminalSize :: IO (Maybe (Int, Int))
hClearFromCursorToLineBeginning ::
  GHC.IO.Handle.Types.Handle -> IO ()
hClearFromCursorToLineEnd :: GHC.IO.Handle.Types.Handle -> IO ()
hClearFromCursorToScreenBeginning ::
  GHC.IO.Handle.Types.Handle -> IO ()
hClearFromCursorToScreenEnd :: GHC.IO.Handle.Types.Handle -> IO ()
hClearLine :: GHC.IO.Handle.Types.Handle -> IO ()
hClearScreen :: GHC.IO.Handle.Types.Handle -> IO ()
hCursorBackward :: GHC.IO.Handle.Types.Handle -> Int -> IO ()
hCursorDown :: GHC.IO.Handle.Types.Handle -> Int -> IO ()
hCursorDownLine :: GHC.IO.Handle.Types.Handle -> Int -> IO ()
hCursorForward :: GHC.IO.Handle.Types.Handle -> Int -> IO ()
hCursorUp :: GHC.IO.Handle.Types.Handle -> Int -> IO ()
hCursorUpLine :: GHC.IO.Handle.Types.Handle -> Int -> IO ()
hGetCursorPosition ::
  GHC.IO.Handle.Types.Handle -> IO (Maybe (Int, Int))
hGetLayerColor ::
  GHC.IO.Handle.Types.Handle
  -> ConsoleLayer
  -> IO (Maybe (colour-2.3.6:Data.Colour.RGB.RGB GHC.Word.Word16))
hGetTerminalSize ::
  GHC.IO.Handle.Types.Handle -> IO (Maybe (Int, Int))
hHideCursor :: GHC.IO.Handle.Types.Handle -> IO ()
hHyperlink ::
  GHC.IO.Handle.Types.Handle -> String -> String -> IO ()
hHyperlinkWithId ::
  GHC.IO.Handle.Types.Handle -> String -> String -> String -> IO ()
hHyperlinkWithParams ::
  GHC.IO.Handle.Types.Handle
  -> [(String, String)] -> String -> String -> IO ()
hNowSupportsANSI :: GHC.IO.Handle.Types.Handle -> IO Bool
hReportCursorPosition :: GHC.IO.Handle.Types.Handle -> IO ()
hReportLayerColor ::
  GHC.IO.Handle.Types.Handle -> ConsoleLayer -> IO ()
hRestoreCursor :: GHC.IO.Handle.Types.Handle -> IO ()
hSaveCursor :: GHC.IO.Handle.Types.Handle -> IO ()
hScrollPageDown :: GHC.IO.Handle.Types.Handle -> Int -> IO ()
hScrollPageUp :: GHC.IO.Handle.Types.Handle -> Int -> IO ()
hSetCursorColumn :: GHC.IO.Handle.Types.Handle -> Int -> IO ()
hSetCursorPosition ::
  GHC.IO.Handle.Types.Handle -> Int -> Int -> IO ()
hSetSGR :: GHC.IO.Handle.Types.Handle -> [SGR] -> IO ()
hSetTitle :: GHC.IO.Handle.Types.Handle -> String -> IO ()
hShowCursor :: GHC.IO.Handle.Types.Handle -> IO ()
hSupportsANSI :: GHC.IO.Handle.Types.Handle -> IO Bool
hSupportsANSIColor :: GHC.IO.Handle.Types.Handle -> IO Bool
hSupportsANSIWithoutEmulation ::
  GHC.IO.Handle.Types.Handle -> IO (Maybe Bool)
hUseAlternateScreenBuffer :: GHC.IO.Handle.Types.Handle -> IO ()
hUseNormalScreenBuffer :: GHC.IO.Handle.Types.Handle -> IO ()
hideCursor :: IO ()
hyperlink :: String -> String -> IO ()
hyperlinkWithId :: String -> String -> String -> IO ()
hyperlinkWithParams ::
  [(String, String)] -> String -> String -> IO ()
layerColor ::
  ConsoleLayer
  -> Text.ParserCombinators.ReadP.ReadP
       (colour-2.3.6:Data.Colour.RGB.RGB GHC.Word.Word16)
reportCursorPosition :: IO ()
reportLayerColor :: ConsoleLayer -> IO ()
restoreCursor :: IO ()
saveCursor :: IO ()
scrollPageDown :: Int -> IO ()
scrollPageUp :: Int -> IO ()
setCursorColumn :: Int -> IO ()
setCursorPosition :: Int -> Int -> IO ()
setSGR :: [SGR] -> IO ()
setTitle :: String -> IO ()
showCursor :: IO ()
useAlternateScreenBuffer :: IO ()
useNormalScreenBuffer :: IO ()
type BlinkSpeed :: *
data BlinkSpeed = SlowBlink | RapidBlink | NoBlink
type Color :: *
data Color
  = Black | Red | Green | Yellow | Blue | Magenta | Cyan | White
type ColorIntensity :: *
data ColorIntensity = Dull | Vivid
type ConsoleIntensity :: *
data ConsoleIntensity
  = BoldIntensity | FaintIntensity | NormalIntensity
type ConsoleLayer :: *
data ConsoleLayer = Foreground | Background | Underlining
type SGR :: *
data SGR
  = Reset
  | SetConsoleIntensity !ConsoleIntensity
  | SetItalicized !Bool
  | SetUnderlining !Underlining
  | SetBlinkSpeed !BlinkSpeed
  | SetVisible !Bool
  | SetSwapForegroundBackground !Bool
  | SetColor !ConsoleLayer !ColorIntensity !Color
  | SetRGBColor !ConsoleLayer
                !(colour-2.3.6:Data.Colour.Internal.Colour Float)
  | SetPaletteColor !ConsoleLayer {-# UNPACK #-}GHC.Word.Word8
  | SetDefaultColor !ConsoleLayer
type Underlining :: *
data Underlining
  = SingleUnderline
  | DoubleUnderline
  | CurlyUnderline
  | DottedUnderline
  | DashedUnderline
  | NoUnderline
clearFromCursorToLineBeginningCode :: String
clearFromCursorToLineEndCode :: String
clearFromCursorToScreenBeginningCode :: String
clearFromCursorToScreenEndCode :: String
clearLineCode :: String
clearScreenCode :: String
cursorBackwardCode :: Int -> String
cursorDownCode :: Int -> String
cursorDownLineCode :: Int -> String
cursorForwardCode :: Int -> String
cursorUpCode :: Int -> String
cursorUpLineCode :: Int -> String
hideCursorCode :: String
hyperlinkCode :: String -> String -> String
hyperlinkWithIdCode :: String -> String -> String -> String
hyperlinkWithParamsCode ::
  [(String, String)] -> String -> String -> String
reportCursorPositionCode :: String
reportLayerColorCode :: ConsoleLayer -> String
restoreCursorCode :: String
saveCursorCode :: String
scrollPageDownCode :: Int -> String
scrollPageUpCode :: Int -> String
setCursorColumnCode :: Int -> String
setCursorPositionCode :: Int -> Int -> String
setSGRCode :: [SGR] -> String
setTitleCode :: String -> String
showCursorCode :: String
useAlternateScreenBufferCode :: String
useNormalScreenBufferCode :: String
xterm24LevelGray :: Int -> GHC.Word.Word8
xterm6LevelRGB :: Int -> Int -> Int -> GHC.Word.Word8
xtermSystem :: ColorIntensity -> Color -> GHC.Word.Word8
