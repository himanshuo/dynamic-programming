module Catalan (catalan) where

catalan :: Int -> Int
catalan 0 = 1
catalan n =
  let total = (n-1) in
  foldl (\acc x -> acc + (catalan x) * (catalan (total-x)) ) 0 [0..total]

