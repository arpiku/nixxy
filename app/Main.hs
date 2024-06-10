module Main where

import qualified Nixxy 
import qualified Arnold

main :: IO ()
main = do
  Nixxy.sayHello
  Arnold.main

