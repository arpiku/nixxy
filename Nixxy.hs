#! /usr/bin/env runghc

import System.Environment

cmdParser a = return (id)
final = return ()


main = getArgs >>= cmdParser >> final
