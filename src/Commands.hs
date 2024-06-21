#! /usr/bin/env runhaskell

import System.Environment (getArgs)
import Data.Map (Map, fromList, lookup)
import Prelude hiding (lookup)

type Cmd = String
type CmdMonad = IO ()
-- type CmdMap = Map Cmd CmdMonad

act1 :: IO ()
act1 = putStrLn "act1"

act2 :: IO ()
act2 = putStrLn "act1"

act3 :: IO ()
act3 = putStrLn "act1"


cmdMap :: Map Cmd CmdMonad
cmdMap = fromList [
	("act1", act1)
	("act2", act2)
	("act3", act3) ]

-- getAction :: CmdMap -> Cmd -> CmdMonad
-- getAction CmdMap Cmd = case lookup Cmd CmdMap of
-- 	Just action -> action
-- 	Nothing     -> putStrLn "UnknowN"
-- 	_           -> putStrLn "boog"
--

main :: IO ()
main = do
