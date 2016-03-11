module Bag.Test where

import Test.Unit (test, runTest)
import Test.Unit.Assert as Assert

import Prelude
import Bag
import Data.Maybe (Maybe(..))

bagOfTruth = Bag { item: true, count: 1, rest: EmptyBag }

main = runTest do
  test "Bag" do
    Assert.equal (Just true) result
    where result = (pickOne bagOfTruth).pick