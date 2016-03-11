module Stack where

import Prelude
import Data.List as List
import Data.Maybe as Maybe

class Stack s where
  cons :: forall foo. foo -> s foo -> s foo
  uncons :: forall foo. s foo -> Maybe.Maybe { head :: foo, tail :: s foo }

instance stackList :: Stack (List.List) where
  cons = List.Cons
  uncons = List.uncons

data Pair s1 s2 = Pair s1 s2

instance showPair :: (Show s1, Show s2) => Show (Pair s1 s2) where
  show (Pair s1 s2) = "Pair:\n  " ++ (show s1) ++ "\n  " ++ (show s2)

class DoubleStack d where
  moveRight :: d -> d
  --moveLeft :: d -> d

instance doubleStackPair :: (Stack s1, Stack s2) => DoubleStack (Pair (s1 foo) (s2 foo)) where
  moveRight (Pair left right) = goRight left right (uncons left)
    where
    goRight l r Maybe.Nothing = Pair l r
    goRight _ r (Maybe.Just { head = movingItem, tail = newLeft }) = Pair newLeft (cons movingItem r)