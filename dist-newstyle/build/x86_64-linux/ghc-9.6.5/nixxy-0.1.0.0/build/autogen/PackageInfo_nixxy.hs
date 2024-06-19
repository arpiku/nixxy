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
synopsis = "Bunch of Code that helps me...code and stuff."
copyright :: String
copyright = ""
homepage :: String
homepage = "arpiku.xyz/nixxy"
