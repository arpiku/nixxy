#! /usr/bin/env runghc

import Control.Monad.Trans.Maybe(MaybeT(..))
import Control.Monad.Reader(ReaderT(..), ask)
import Control.Monad.Trans (lift)
import System.Environment
import Data.Map as DMap
import System.Directory
import Data.UUID
import Data.UUID.V4
import Data.Char
import Data.List

data Config = Config {
                        getCodeDir :: FilePath
    } deriving (Show)

data Code = Code {
                getId :: UUID,
                getFile :: FilePath,
                getCodeType :: String,
                isScript :: Bool
    }

data LCProblem = LCProblem{
                        getQId :: Int,
                        getProblem :: String,
                        getSolutions :: [Code]
    }

-- LeetCode Related Functionality
--type Msg = String
--makeLCProblemFilePath :: ReaderT Config IO Msg
--makeLCProblemFilePath qNum = ReaderT $ ask >>= \config ->
  {-                          return $ if (doesDirectoryExist qDir) then
                            "Directory Exists"
                            else
                            "No Dir"
                            where qDir = getCodeDir kkk

-}


-- runReaderT fn $ Config "/home/arpiku"

getLCQdir :: (Monad m) => Int -> ReaderT Config m String
getLCQdir qNum = ask >>= \config -> return (getCodeDir config ++ "/leetcode/" ++ show qNum)

fn qNum config = doesDirectoryExist =<< runReaderT (getLCQdir qNum config)


