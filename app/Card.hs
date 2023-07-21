module Card where


import Data.Text (Text)

import Character


-- * Data Types, Type Classes, & Operators

-- | Data type for 'Card' types. 
data CType = Attack
           | Defense
           | Unknown
           deriving (Show, Eq)

-- | The target of a buff/debuff.
data Target = Self
            | Enemy Int  -- ^ The number of enemies the player must select to apply a 'Trait' to.
            | All
            deriving (Show, Eq)

data Effect = DMG Int
            | DEF Int
            | APP Trait Target
            deriving (Show, Eq)

data Card = Card
  { cardName    :: Text
  , cardType    :: CType
  , cardCost    :: Int
  , cardEffects :: [Effect]
  , cardAgainst :: [Trait]
  } deriving (Show, Eq)

{- | The 'unsafeFuse' operator attempts at combining two cards.
Used to define the 'Semigroup' instance for 'Card'.

In case of failure, it returns the first card.

For a safe variant returning a 'Maybe' 'Card', see 'fuse' below.
-}
unsafeFuse :: Card -> Card -> Card
unsafeFuse x _ = x

instance Semigroup Card where
  (<>) = unsafeFuse


-- * Helper Functions

-- | Safe 'fuse' operator. Returns 'Nothing' at failure.
fuse, (.+) :: Card -> Card -> Maybe Card
fuse _ _ = Nothing
(.+) = fuse
infixl 4 .+

{- | Useless cards are of type 'Unknown'.
They do nothing but fill the player's hand and may even cost PR!
-}
mkUseless :: Text -> Int -> Card
mkUseless name cost = Card name Unknown cost [] []

mkNeutral :: Text -> CType -> Int -> [Effect] -> Card
mkNeutral name ctype cost effs = Card name ctype cost effs []


-- * Pre-made Cards

-- | An utterly useless card. Does and costs nothing.
doNothing :: Card
doNothing = mkUseless "Do nothing"  0
