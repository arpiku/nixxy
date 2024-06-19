{-import Data.Map as DMap
import System.IO as SysIO
import System.Environment SysEnv

type Cmd = String
type CmdMonad = IO ()

type CmdTree = Map Cmd CmdMonad

-}


#!/usr/bin/env runhaskell

import System.Environment 
import Control.Monad 

data CommandTree = Node String (IO ()) [CommandTree]

action1 :: IO ()
action1 = putStrLn "Action 1 executed!"

action2 :: IO ()
action2 = putStrLn "Action 2 executed!"

action3 :: IO ()
action3 = putStrLn "Action 3 executed!"

-- Construct the command tree
commandTree :: CommandTree
commandTree = Node "root" (return ()) 
    [ Node "command1" action1 []
    , Node "command2" action2 []
    , Node "command3" action3 []
    ]

-- Function to find and execute a command
findAndExecute :: [String] -> CommandTree -> IO ()
findAndExecute [] (Node _ action _) = action
findAndExecute (cmd:cmds) (Node _ _ children) = 
    case filter (\(Node name _ _) -> name == cmd) children of
        [Node _ action nextChildren] -> findAndExecute cmds (Node cmd action nextChildren)
        _ -> putStrLn "Command not found!"

main :: IO ()
main = do
    args <- getArgs
    when (null args) $ putStrLn "Usage: ./script.hs command [subcommand ...]"
    unless (null args) $ findAndExecute args commandTree


-- main = do
    -- args <- getArgs
    -- mapM putStrLn args
    -- return ()
