-- ~\~ language=Haskell filename=src/P03.hs
-- ~\~ begin <<docs/README.md|P03>>[0]
module P03 where

data Instructions = Push Int Instructions
                  | Add Instructions
                  | Mul Instructions
                  | Dup Instructions
                  | Swap Instructions
                  | Neg Instructions
                  | Pop Instructions
                  | Over Instructions
                  | IfZero Instructions Instructions
                  | Loop (Instructions -> Instructions)
                  | Halt
-- ~\~ end
-- ~\~ begin <<docs/README.md|P03>>[1]
run :: Instructions -> Maybe [Int]
run = undefined
-- ~\~ end
-- ~\~ begin <<docs/README.md|P03>>[2]
-- | factorial as an example
-- >>> fact 5
-- Just 120

fact5 :: Instructions
fact5 = Push 5 $ Push 1 $ Swap $ Loop $ \loop ->
  Dup
    $ IfZero (Pop $ Halt)
    $ Swap
    $ Over
    $ Mul
    $ Swap
    $ Push 1
    $ Neg
    $ Add
    $ loop
-- ~\~ end
-- ~\~ begin <<docs/README.md|P03>>[3]

-- | 3.3 A parser for stack programs
-- Example program
-- {
--     push 5;
--     push 1;
--     swap;
--     loop {
--          dup;
--          ifzero {
--                 pop;
--                 halt
--                 } {
--                 swap;
--                 over;
--                 mul;
--                 swap;
--                 push 1;
--                 neg;
--                 add;
--                 ret
--                 }
--         }
-- }
-- ~\~ end
-- ~\~ begin <<docs/README.md|P03>>[4]
-- Grammar
-- block -> "{" instrs "}"
-- instrs -> simple ";" instrs | ctrl
-- simple -> "push " int | "add" | "mul" | "dup" | "swap" | "neg"| "pop" | "over"
-- ctrl -> "ifzero" block block | "loop" block | "halt" | "ret"
-- ~\~ end
