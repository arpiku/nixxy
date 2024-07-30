





--getProblem :: (Monad m) DirTree -> m [Problem]
--getProblem (File fp []) = return ([Problem $ readProblem fp])
--getProblem (File fp [EmptyDir]) = getProblem (File fp [])
--getProblem (EmptyDir) = return ([Problem (minBound :: Int), "", [],[]])
--getProblem (File fp (x:xs)) = return ((++) <$> getProblem fp [EmptyDir] <*> getProblem x xs)

--addQuestionFolder :: QNum -> QFolder
--addQuestionSolution :: QNum -> QSolution


{- Commands :
add lc-question <QNum>
add lc-solution <QNum> -lang <language Name>
add script <Type(Python,Haskell,Bash,Fish etc..)> <Name> ## Name will have a default value as well -save -draft -throwaway


add note <Type> (Code, general daily note)

drop shell <Name>

show lc-solution <QNum>

add algorithm -lang (<Title>

select shell *Displays list of saved nix-shells*


use github's free static site service to provide 'dynamic' behaviour?


-}
