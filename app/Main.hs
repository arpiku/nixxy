module Main where

--import qualified Nixxy

import System.Environment
import Data.List

min :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  args <- getArgs
  mapM putStrLn args



