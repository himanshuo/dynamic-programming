{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# LANGUAGE RecordWildCards #-}

import Data.Foldable     (for_)
import Test.Hspec        (Spec, describe, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)
import Catalan (catalan)

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = describe "catalan" $ for_ cases test
  where

    test Case{..} = it description assertion
      where
        assertion  = expression `shouldBe` expected
        expression = catalan n

data Case = Case { description :: String
                 , n     :: Int
                 , expected    :: Int
                 }

cases :: [Case]
cases = [ Case {  description     = "0"
                , n               = 0
                , expected        = 1
               },
          Case {  description     = "1"
                , n               = 1
                , expected        = 1
               },
          Case {  description     = "2"
                , n               = 2
                , expected        = 2
               },
          Case {  description     = "3"
                , n               = 3
                , expected        = 5
               },
          Case {  description     = "4"
                , n               = 4
                , expected        = 14
               },
          Case {  description     = "5"
                , n               = 5
                , expected        = 42
               },
          Case {  description     = "6"
                , n               = 6
                , expected        = 132
               }
        ]


