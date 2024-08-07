
import System.Random
    import Data.Char

import Nixxy (func)


--generateRandomListNums l h seed = randomRs (l,h) $ mkStdGen seed

--generateRandomChars = map chr $ generateRandomListNums 60 100 23

--generateRandomStrings = take 5 generateRandomChars

ax = show (func 2 4)

