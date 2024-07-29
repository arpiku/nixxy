#! /usr/bin/env runghc

{-

initArticleDir -- Will implement some other day
addArticleIdea --String(idea)i
addArticle --titleJ
editArticle -- edit articleId
editArticleWithPizzas - edit article with a renderer
showArticleStash --i
publishArticle ArticleId
pullArticleBack ArticleId
-}


import Data.UUID (UUID)
import Data.UUID.V4
import System.Directory
import Data.Time
import System.Process


data Status = Idea | Draft | Published deriving (Eq ,Ord, Show)
data Article = Article {id :: UUID, status :: Status, references :: Maybe FilePath, location :: FilePath}

addIdea s =




