{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric  #-}

-- | W4.1 Nested datatypes
module W0401
    ( -- * Type
      Perfect (..)
      -- * Subtask W4.1.1
    , reversePerfect
      -- * Subtask W4.1.2
    , index
      -- * Subtask W4.1.3
    , build, buildSimple
    ) where

import Control.DeepSeq (NFData)  -- needed for benchmarking
import GHC.Generics    (Generic) -- needed to derive NFData

data Perfect a = Z a | S (Perfect (a, a))
    deriving (Show, Generic, NFData)

-- Subtask W4.1.1

-- | Creates a perfect tree of the same shape, but with all leaves in reversed order.
--
-- >>> reversePerfect $ Z True
-- Z True
--
-- >>> reversePerfect $ S $ Z (10, 23)
-- S (Z (23,10))
--
-- >>> reversePerfect $ S $ S $ Z (('a', 'b'), ('c', 'd'))
-- S (S (Z (('d','c'),('b','a'))))
--
reversePerfect :: Perfect a -> Perfect a
reversePerfect = error "TODO: implement reversePerfect"

-- Subtask W4.1.2

-- | Looks up the element with the given index (from the left,
-- starting at `0`) and fails if the index is out of bounds.
-- Has logarithmic complexity in the number of elements in the tree.
--
-- >>> index (Z False) 0
-- Just False
--
-- >>> index (Z True) 1
-- Nothing
--
-- >>> index (S (S (Z (('a', 'b'),('c', 'd'))))) 2
-- Just 'c'
--
-- >>> index (S (S (Z (('a', 'b'),('c', 'd'))))) 20
-- Nothing
--
index :: Perfect a -> Int -> Maybe a
index = error "TODO: implement index"

-- Subtask W4.1.3

-- | Builds a tree of a given height, taking the leaves from the list
-- (from left to right). The function will crash if the list is too short.
--
-- >>> build 0 "Haskell"
-- Z 'H'
--
-- >>> build 1 "Haskell"
-- S (Z ('H','a'))
--
-- >>> build 2 "Haskell"
-- S (S (Z (('H','a'),('s','k'))))
--
-- >>> build 3 "Haskell"
-- S (S (S (Z ((('H','a'),('s','k')),(('e','l'),('l',*** Exception: ...
-- ...
--
build :: Int -> [a] -> Perfect a
build = error "TODO: implement build"

-- | Builds a perfect tree of the given height with unit values in the leaves.
--
-- >>> buildSimple 0
-- Z ()
--
-- >>> buildSimple 2
-- S (S (Z (((),()),((),()))))
--
buildSimple :: Int -> Perfect ()
buildSimple = error "TODO: implement buildSimple"
