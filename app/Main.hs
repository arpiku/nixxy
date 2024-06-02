module Main where

import qualified Nixxy 

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  Nixxy.sayHello
  Nixxy.sayHelloN

