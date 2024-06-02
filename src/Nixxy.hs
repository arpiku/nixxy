module Nixxy where
import qualified NixxySay

sayHello :: IO ()
sayHello = putStrLn "Hello I am nixxy, here to help!"

sayHelloN :: IO ()
sayHelloN = NixxySay.nixxySay "Hello I amm nixxy, here to help!"


