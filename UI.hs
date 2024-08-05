
module UI

where

import System.Console.ANSI
import Control.Monad (zipWithM_,when)
import System.IO (BufferMode (..), stdin, hReady, hSetEcho, hSetBuffering)
--For Selectable List
--
selected = [SetColor Background Vivid Cyan]
alt1 = [SetColor Background Vivid White]
alt2 = [SetColor Background Vivid Blue]


fmtStrings fmts [] = []
fmtStrings [] xs = []
fmtStrings (fmt:fmts) (x:xs) = fmt x : fmtStrings fmts xs

serialNumAdd strs = zipWith addSerialNum [1..] strs
                            where
                                addSerialNum i str = show i ++ ".-." ++ str

prettyPrint sgrs str = setSGR sgrs >> putStr str >> setSGR [Reset] >> putStrLn ""


getSGRList n
        | n <= 0 = []
        | n == 1 = [selected,alt1]
        | otherwise = selected : concat  (replicate (n `div` 2) [alt1, alt2])


printSelectableList sgrs xs = zipWithM_ prettyPrint sgrs xs


-- https://stackoverflow.com/questions/23068218/haskell-read-raw-keyboard-input/38553473#38553473
getKey :: IO [Char]
getKey = reverse <$> getKey' ""
  where getKey' chars = do
          char <- getChar
          more <- hReady stdin
          (if more then getKey' else return) (char:chars)


rotateUp [x] = [x]
rotateUp (x:xs) = xs ++ [x]


rotateDown [x] = [x]
rotateDown xs = [last xs] ++ init xs


menuController (sgrs, strs) = do
  clearScreen
  hSetBuffering stdin NoBuffering
  hSetEcho stdin False
  printSelectableList sgrs strs
  key <- getKey
  when (key /= "\ESC") $ do
    case key of
      "\ESC[A" -> menuController (rotateUp sgrs, strs)
      "\ESC[B" -> menuController (rotateDown sgrs, strs)
--      "\ESC[C" -> putStr "→"
--      "\ESC[D" -> putStr "←"
--      "\n"     -> putStr "⎆"
--      "\DEL"   -> putStr "⎋"
      _        -> return ()
    menuController (sgrs, strs)


-- Simple menu controller
main = do
  hSetBuffering stdin NoBuffering
  hSetEcho stdin False
  key <- getKey
  when (key /= "\ESC") $ do
    case key of
      "\ESC[A" -> putStr "↑"
      "\ESC[B" -> putStr "↓"
      "\ESC[C" -> putStr "→"
      "\ESC[D" -> putStr "←"
      "\n"     -> putStr "⎆"
      "\DEL"   -> putStr "⎋"
      _        -> return ()
    main

