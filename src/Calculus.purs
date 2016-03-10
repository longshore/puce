module Calculus where

import Prelude
import Data.Array (range)
import Data.Int (toNumber)
import Data.Foldable (sum)

divideN :: Int -> Number -> Number
divideN n = \r -> r / (toNumber n)

posts :: Int -> Array Number
posts n = map (divideN n <<< toNumber) (range 0 (n - 1))

estimateIntegral :: (Number -> Number) -> Int -> Number
estimateIntegral curve n = sum $ map (curve >>> divideN n) (posts n)