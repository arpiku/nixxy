{-# LANGUAGE OverloadedStrings #-}

import System.Process (createProcess, proc, waitForProcess)
import System.Directory (getCurrentDirectory)
import System.IO (hPutStrLn, stderr)
import System.INotify
import Control.Concurrent (threadDelay)
import Control.Monad (forever)

-- Function to launch Kakoune in a specific directory
launchKakoune :: FilePath -> IO ()
launchKakoune dir = do
    (_, _, _, ph) <- createProcess (proc "kak" ["-d", dir])
    _ <- waitForProcess ph
    return ()

-- Function to monitor a directory for file save events and record them
monitorDirectory :: FilePath -> IO ()
monitorDirectory dir = do
    inotify <- initINotify
    _ <- addWatch inotify [Modify, CloseWrite] dir handleEvent
    forever $ threadDelay 1000000  -- Sleep for 1 second

-- Event handler to handle file modifications and saves
handleEvent :: Event -> IO ()
handleEvent (Modified _ (Just fp)) = recordChange fp
handleEvent (Closed _ (Just fp) _) = recordChange fp
handleEvent _ = return ()

-- Function to record the changes
recordChange fp = do
    currentDir <- getCurrentDirectory
    let recordFile = currentDir ++ "/file_changes.log"
    appendFile recordFile (fp ++ " was modified.\n")
    putStrLn $ "Recorded change for file: " ++ fp

main :: IO ()
main = do
    let dir = "/path/to/your/directory"
    launchKakoune dir
    monitorDirectory dir

