module Main
  ( main -- :: IO ()
  ) where
import           Test.Tasty (defaultMain, testGroup)

import qualified Tests.IO        as IO
import qualified Tests.CBOR      as CBOR
import qualified Tests.Regress   as Regress
import qualified Tests.Reference as Reference
import qualified Tests.Serialise as Serialise
import qualified Tests.Negative  as Negative
import qualified Tests.Deriving  as Deriving
import qualified Tests.GeneralisedUTF8  as GeneralisedUTF8

main :: IO ()
main = Reference.loadTestCases >>= \tcs -> defaultMain $
  testGroup "CBOR tests"
    [ CBOR.testTree tcs
    , Reference.testTree tcs
    , Serialise.testTree
    , Serialise.testGenerics
    , Negative.testTree
    , IO.testTree
    , Regress.testTree
    , Deriving.testTree
    , GeneralisedUTF8.testTree
    ]
