module Character where


import Data.Text (Text)


-- | Duration of a 'Trait'.
data Duration = Permanent
              | EndsAfter Int
              deriving (Show, Eq)

data Trait = Trait
  { trName      :: Text
  , trDuration  :: Duration
  } deriving (Show, Eq)

data Gender = M
            | F
            | NB
            | Gender Text
            deriving (Show, Eq)

data Character = Character
  { chrName   :: Text
  , chrGender :: Gender
  , chrTraits :: [Trait]  -- ^ Traits that the character starts the combat with.
  } deriving (Show, Eq)
