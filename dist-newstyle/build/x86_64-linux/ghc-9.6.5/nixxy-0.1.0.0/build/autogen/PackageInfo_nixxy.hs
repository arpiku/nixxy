{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_nixxy (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "nixxy"
version :: Version
version = Version [0,1,0,0] []

synopsis :: String
synopsis = "Set of cmd line tools to get things done faster, that's it."
copyright :: String
copyright = ""
homepage :: String
homepage = ""
