{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# LANGUAGE RecordWildCards #-}

import Data.Foldable     (for_)
import Test.Hspec        (Spec, describe, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)
import Template (template)

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = describe "template" $ for_ cases test
  where

    test Case{..} = it description assertion
      where
        assertion  = expression `shouldBe` expected
        expression = template input_value

data Case = Case { description :: String
                 , input_value     :: Int
                 , expected    :: Int
                 }

cases :: [Case]
cases = [ Case {   description    = "base case"
                 , input_value    = 1
                 , expected       = 4
               },
         Case {   description     = "hard case"
                , input_value     = 99
                , expected        = 4
              }
        ]


