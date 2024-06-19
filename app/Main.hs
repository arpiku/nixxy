module Main where

--import qualified Nixxy

import System.Environment
import Data.List

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  args <- getArgs
  mapM putStrLn args



