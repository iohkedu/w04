-- ~\~ language=Haskell filename=src/P02.hs
-- ~\~ begin <<docs/README.md|P02>>[0]
module P02 where

data Perfect a = Z a | S (Perfect (a, a))
-- ~\~ end
-- ~\~ begin <<docs/README.md|P02>>[1]
reverse :: Perfect a -> Perfect a
reverse = undefined
-- ~\~ end
-- ~\~ begin <<docs/README.md|P02>>[2]
index :: Perfect a -> Int -> Maybe a
index = undefined
-- ~\~ end
-- ~\~ begin <<docs/README.md|P02>>[3]
build :: Int -> [a] -> Perfect a
build = undefined
-- ~\~ end
-- ~\~ begin <<docs/README.md|P02>>[4]
buildEasier :: Int -> Perfect ()
buildEasier = undefined
-- ~\~ end
