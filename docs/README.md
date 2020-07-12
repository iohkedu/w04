# Weekly Assignments 4

Note that some tasks may deliberately ask you to look at concepts or libraries
that we have not yet discussed in detail. But if you are in doubt about the scope
of a task, by all means ask.
Please try to write high-quality code at all times! This means in particular that
you should add comments to all parts that are not immediately obvious. Please
also pay attention to stylistic issues. The goal is always to submit code that does
not just correctly do what was asked for, but also could be committed without
further changes to an imaginary company codebase.

## W4.1 Packaging

Prepare a Cabal package to contain all your solutions so that it can easily be
built using cabal-install or stack.
Note that one package can contain one library (with arbitrarily many modules)
and possibly several executables and test suites.
Please include aREADMEfile in the end explaining clearly where within the
package the solutions to the individual subtasks are located.
Please do _NOT_ try to upload your package to Hackage.

## W4.2 Nested datatypes

Recall the type of perfect trees,

```haskell id="P02" file="src/P02.hs"
module P02 where

data Perfect a = Z a | S (Perfect (a, a))
```

### Subtask 4.2.1

Define a function

```haskell id="P02"
reverse :: Perfect a -> Perfect a
reverse = undefined
```

that creates a perfect tree of the same shape, but with all the leaves in reversed
order.

### Subtask 4.2.2

Define a function

```haskell id="P02"
index :: Perfect a -> Int -> Maybe a
index = undefined
```

that looks up the element with the given index (from the left, starting at 0 ),
and fails if the index is out of bounds. The function should have logarithmic
complexity on the number of elements in the tree.

### Subtask 4.2.3

Define a function

```haskell id="P02"
build :: Int -> [a] -> Perfect a
build = undefined
```

such thatbuild n xsbuilds a tree of heightn(i.e., with2 ˆ nelements), taking
the leaves from the list (from left to right). The function is allowed to crash if
the list is too short. Use theStatemonad.
Note: If this is too difficult, at least try to define the much simpler function

```haskell id="P02"
buildEasier :: Int -> Perfect ()
buildEasier = undefined
```

that builds a perfect tree of the given height with unit values in the leaves.

### W4.3 Benchmarking

Have a look at the =criterion= package for benchmarking. Using =criterion=, test
the efficiency of indexing the first, the middle and the last element of a perfect
tree of different height. See how the runtime evolves with growing trees.
Try to pay attention to the following:

- the time for building the tree should not be measured,
- the time for indexing should not be cached due to laziness.

Turn the benchmark into a benchmark suite in the Cabal file so that it can be
run via =cabal bench= or stack bench. Try to generate a nice html-report as
well.

## W4.4 Mini private keys

The Bitcoin Wiki at [bitcoin.it](https://en.bitcoin.it/wiki/Mini_private_key_format)
describes a format for Mini Private Keys.
You are allowed to use the =cryptonite= and =base58-bytestring= packages

### Subtask 4.4.1

Define a validator for mini private keys that determines if a given input is a
valid mini private key and outputs the corresponding full private key.
This validator should be available as a library function

```haskell id="P04" file="src/P04.hs"
module P04 where
```

and as an executable

```haskell id="validator" file="exe/validator.hs"
module Validator where
```

that reads the mini private key to test from the standard input.

### Subtask 4.4.2

Define a function that transforms a private key into Wallet Import Format as
described on [bitcoin.it](https://en.bitcoin.it/wiki/Wallet_import_format)

Also implement the reverse transformation. This functionality should be available
both as a library function and as an exectuable.
