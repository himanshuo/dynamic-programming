

module Ways (ways) where

-- https://www.geeksforgeeks.org/solve-dynamic-programming-problem/


-- Given 3 numbers {1, 3, 5}, we need to tell
-- the total number of ways we can form a number 'N'
-- using the sum of the given three numbers.
-- (allowing repetitions and different arrangements).
--
-- Total number of ways to form 6 is: 8
-- 1+1+1+1+1+1
-- 1+1+1+3
-- 1+1+3+1
-- 1+3+1+1
-- 3+1+1+1
-- 3+3
-- 1+5
-- 5+1


-- This is a bit more general

ways :: Int -> [Int] -> Int
ways 0 values = 1
ways target values = if target <= 0
                      then 0
                      else
                        foldl (\acc val -> acc + (ways (target - val) values)) 0 values
