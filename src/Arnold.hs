{-# LANGUAGE OverloadedStrings #-}


module Arnold where

import DBus
import DBus.Client
import Control.Monad
import System.Process (spawnCommand)

main :: IO ()
main = do
    -- Launch Terminator
    _ <- spawnCommand "terminator"

    -- Wait a bit for Terminator to start
    putStrLn "Waiting for Terminator to start..."
    -- threadDelay 3000000

    -- Connect to the session bus
    client <- connectSession

    -- Get the Terminator service
    let service = "net.tenshu.Terminator"
        path = objectPath_ "/net/tenshu/Terminator"
        iface = interfaceName_ "net.tenshu.Terminator"

    -- Open a new tab in the default window
    let openNewTab = (methodCall path iface "new_tab") { methodCallDestination = Just service }

    -- Call the method
    result <- call_ client openNewTab

    -- Check the result
    -- case result of
        -- Left err -> putStrLn $ "Error: " ++ show err
        -- Right _ -> putStrLn "New tab opened in Terminator"
    return ()

