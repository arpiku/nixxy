# Ghci

:{
let logFile = "/home/david/.ghc/ghci.log"
    maxLogLength = 1024 -- max length of a single write
    logPrint x = appendFile logFile (take maxLogLength (show x) ++ "\n") >> print x
:}
:set -interactive-print=logPrint
