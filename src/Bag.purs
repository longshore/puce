module Bag where

import Prelude
import Data.Maybe (Maybe(..))

data Bag foo = EmptyBag | Bag {
  item :: foo, count :: Int, rest :: Bag foo
}

class Pickable p foo where
  pickOne :: p foo -> { pick :: Maybe foo, rest :: p foo }

class Countable c where
  count :: c -> Int

instance pickableBag :: Pickable Bag foo where
  pickOne EmptyBag = { pick: Nothing, rest: EmptyBag }
  pickOne (Bag o) = { pick: Just o.item, rest: Bag o { count = o.count - 1 }}

instance countableBag :: Countable (Bag foo) where
  count EmptyBag = 0
  count (Bag b) = 1 + count b.rest