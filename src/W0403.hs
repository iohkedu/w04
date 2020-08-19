-- | W4.3 Mini private keys
module W0403
    ( -- * Subtask W4.3.1
      validate
      -- * Subtask W4.3.2
    , Net (..), Mode (..), WalletParams (..)
    , toWallet
      -- * Subtask W4.3.3
    , fromWallet
    ) where

-- Subtask W4.3.1

-- | Validates a mini private key (given as a @'String'@), returns @'Nothing'@ if the key is invalid,
-- otherwise @'Just'@ the private key.
--
-- >>> validate "S6c56bnXQiBjk9mqSYE7ykVQ7NzrRy"
-- Just "4c7a9640c72dc2099f23715d0c8a0d8a35f8906e3cab61dd3f78b67bf887c9ab"
--
-- >>> validate "S6c56bnXQiBjk9mqSYE7ykVQ7NzrRz"
-- Nothing
--
validate :: String -> Maybe String
validate = error "TODO: implement validate"

-- Subtask W4.3.2

-- | The targeted network.
data Net = Main | Test
    deriving (Show, Read, Eq)

-- | The public key mode.
data Mode = Compressed | Uncompressed
    deriving (Show, Read, Eq)

-- | A type representing to possible configurations for conversion to- and from
-- wallet import format.
data WalletParams = WalletParams Net Mode
    deriving (Show, Read, Eq)

-- | Tries to convert a private key to wallet input format.
--
-- >>> toWallet (WalletParams Main Uncompressed) "0c28fca386c7a227600b2fe50b7cae11ec86d3bf1fbe471be89827e19d72aa1d"
-- Just "5HueCGU8rMjxEXxiPuD5BDku4MkFqeZyd4dZ1jvhTVqvbTLvyTJ"
--
-- >>> toWallet (WalletParams Main Uncompressed) "1111111111111111111111111111111111111111111111111111111111111111"
-- Just "5HwoXVkHoRM8sL2KmNRS217n1g8mPPBomrY7yehCuXC1115WWsh"
--
-- >>> toWallet (WalletParams Main Compressed) "1111111111111111111111111111111111111111111111111111111111111111"
-- Just "KwntMbt59tTsj8xqpqYqRRWufyjGunvhSyeMo3NTYpFYzZbXJ5Hp"
--
-- >>> toWallet (WalletParams Test Uncompressed) "1111111111111111111111111111111111111111111111111111111111111111"
-- Just "91iS7EZqPeRGqPXcPiKLtbfjfLVUYYj17oQ54H3iFFw3n1UmZSS"
--
-- >>> toWallet (WalletParams Test Compressed) "1111111111111111111111111111111111111111111111111111111111111111"
-- Just "cN9spWsvaxA8taS7DFMxnk1yJD2gaF2PX1npuTpy3vuZFJdwavaw"
--
toWallet :: WalletParams -> String -> Maybe String
toWallet = error "TODO: implement toWallet"

-- Subtask W4.3.3

-- | Tries to convert from wallet input format to a private key.
--
-- >>> fromWallet (WalletParams Main Uncompressed) "5HueCGU8rMjxEXxiPuD5BDku4MkFqeZyd4dZ1jvhTVqvbTLvyTJ"
-- Just "0c28fca386c7a227600b2fe50b7cae11ec86d3bf1fbe471be89827e19d72aa1d"
--
-- >>> fromWallet (WalletParams Main Uncompressed) "5HwoXVkHoRM8sL2KmNRS217n1g8mPPBomrY7yehCuXC1115WWsh"
-- Just "1111111111111111111111111111111111111111111111111111111111111111"
--
-- >>> fromWallet (WalletParams Main Compressed) "KwntMbt59tTsj8xqpqYqRRWufyjGunvhSyeMo3NTYpFYzZbXJ5Hp"
-- Just "1111111111111111111111111111111111111111111111111111111111111111"
--
-- >>> fromWallet (WalletParams Test Uncompressed) "91iS7EZqPeRGqPXcPiKLtbfjfLVUYYj17oQ54H3iFFw3n1UmZSS"
-- Just "1111111111111111111111111111111111111111111111111111111111111111"
--
-- >>> fromWallet (WalletParams Test Compressed) "cN9spWsvaxA8taS7DFMxnk1yJD2gaF2PX1npuTpy3vuZFJdwavaw"
-- Just "1111111111111111111111111111111111111111111111111111111111111111"
--
-- >>> fromWallet (WalletParams Main Uncompressed) "5HueCGU8rMjxEXxiPuD5BDku4MkFqeZyd4dZ1jvhTVqvbTLvyTj"
-- Nothing
--
fromWallet :: WalletParams -> String -> Maybe String
fromWallet = error "TODO: implement fromWallet"
