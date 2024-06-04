

foldIO :: MonadIO io => Shell a -> FoldM IO a r -> io r
foldIO s f = liftIO(_foldIO s f)
