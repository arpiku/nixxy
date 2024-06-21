#!/usr/bin/env runhaskell
import System.Environment (getArgs)
import Data.Map(Map, fromList, lookup)
import Prelude hiding (lookup)


type Cmd = String
type CmdMonad = IO ()


action1 :: IO ()
action1 = putStrLn "Action 1 executed!"

action2 :: IO ()
action2 = putStrLn "Action 2 executed!"

action3 :: IO ()
action3 = putStrLn "Action 3 executed!"

actionMap :: Map Cmd CmdMonad
actionMap = fromList [
    ("action1", action1),
    ("action2", action2),
    ("action3", action3)
  ]




main :: IO ()
main = do
    args <- getArgs
    case args of
        [key] -> case lookup key actionMap of
            Just action -> action
            Nothing -> putStrLn "Action Not Defined"
        _     -> putStrLn "Incorrect action name"

