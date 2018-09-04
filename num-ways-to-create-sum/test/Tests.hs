{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# LANGUAGE RecordWildCards #-}

import Data.Foldable     (for_)
import Test.Hspec        (Spec, describe, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)
import Ways (ways)

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = describe "ways" $ for_ cases test
  where

    test Case{..} = it description assertion
      where
        assertion  = expression `shouldBe` expected
        expression = ways target values

data Case = Case { description :: String
                 , target     :: Int
                 , values     :: [Int]
                 , expected    :: Int
                 }

cases :: [Case]
cases = [ Case { description = "fail case"
                 , target     = 6
                 , values     = []
                 , expected   = 0
               },
         Case { description = "provided easy"
                , target     = 6
                , values     = [1, 3, 5]
                , expected   = 8
              },
        Case { description = "provided hard"
               , target     = 10
               , values     = [1, 3, 5]
               , expected   = 47
             }
        ]


