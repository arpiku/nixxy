#! /usr/bin/env runghc

import GHC.Generics
import Data.Functor.Identity


newtype StateT s m a = StateT {runStateT :: s -> m (a,s) } deriving Generic -- a -> Rep a x; Rep a x -> a

evalStateT :: (Monad m) => StateT s m a -> s -> m a
evalStateT m s = runStateT m s >>= \(~(a,_)) -> return a
{-# INLINE evalStateT #-}

execStateT :: (Monad m) => StateT s m a -> s -> m s
execStateT m s = runStateT m s >>= \(~(_,s')) -> return s'
{-# INLINE execStateT #-}

mapStateT :: (m (a, s) -> n (b, s)) -> StateT s m a -> StateT s n b
mapStateT f m = StateT $ f . runStateT m
{-# INLINE mapStateT #-}







