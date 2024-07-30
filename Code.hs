#! /usr/bin/env runghc

import System.Environment
import Data.Map as DMap
import System.Directory
import Data.UUID
import Data.UUID.V4
import Data.Char
import Data.List

codeDir = "/home/arpiku/codeSnippets/Vault"
headerFile = "/home/arpiku/codeSnippets/Vault/head.hs"


data DirTree = EmptyDir | File FilePath [DirTree] deriving (Show,Eq,Read)


data Code = Code {
                    getCodeId :: UUID,
                    getCodeTitle :: String,
                    getCode :: FilePath
                 } deriving (Show, Eq, Read)

data Problem = Problem {
                            getQuestionNum :: Int,
                            getQuestion :: String,
                            getSolutions :: [Code]

                        } deriving (Show, Eq, Read)




getCmds = getArgs
wrongCmd :: Monad m => m String
wrongCmd = return "Wrong Usage"


{-
addLCProblem ==
    addProblemFolder
    addQuestionFile
    addSolutionsFolder
    Maybe addSolutionsCode
-}

--some times the beauty of the world gets unbearable and one of us falsly gets convinced that perhaps ending the story is the best ending.


--addLeetCodeQuestion' = addProblem >>= addCode

addToMemory :: a -> Memory a
addToMeomry


addLeetCodeQuestion' :: (Monad m) => [String] -> m String
addLeetCodeQuestion' (name:args) = return (show name)

isValidQNum qNumStr = all isNumber qNumStr
addLeetCodeQuestion :: (Monad m) => [String] -> m String
addLeetCodeQuestion [] = wrongCmd
addLeetCodeQuestion (qNum:args) = if (isValidQNum qNum) then
                                    addLeetCodeQuestion' args
                                  else
                                    (++) <$> wrongCmd <*> return ":: Invalid Qnum"


addCodeScript :: Monad m => p -> m String
addCodeScript args = return "addingCodeScript...."



addCmd :: (Monad m) => [String] -> m String
addCmd [] = return "Wrong usage"
addCmd (arg:args) = case arg of
    "lc-question" -> addLeetCodeQuestion args
    "script" -> addCodeScript args
    _ -> return "No Cmd..."


type ExitMessage = String
processCmds :: (Monad m) => [String] -> m ExitMessage
processCmds [] = wrongCmd
processCmds (arg:args) = case arg of
                        "add" -> addCmd args
                        "create" -> return "creating"
                        "delete" -> return "deleting"
                        _ -> return "Doing Nothing!"



-- Program Exit is just print for now
programExit = print

{-initFunc :: (Monad m) => m ()
initFunc :: loadLastState = read
-}
main =  getCmds >>= processCmds >>= programExit



