{-# LANGUAGE TupleSections #-}

module Game where


import Data.Text (Text)
import Data.Map  (Map)

import Card
import Character


-- * Game State & Logs

-- | Game phases.
data GPhase = InitG
            | EndG
              -- ^ Game phases.

            | InitT
            | EndT
              -- ^ Turn phases.

            | InitP
            | EndP
              -- ^ Player turn phases.
            deriving (Show, Eq)

data IQ = F
        | D
        | C
        | B
        | A
        deriving (Show, Eq, Ord)

data Attitude = Abhor
              | Hate
              | Neutral
              | Friendly
              | Bestie
              deriving (Show, Eq, Ord)

data Player = Player
  { plChar :: Character
  , plDraw :: [Card]
  , plDisc :: [Card]
  , plHand :: [Card]
  , plHP   :: Int
  , plPR   :: Int
  , plDEF  :: Int
  , plIQ   :: IQ
  , plATT  :: Map Player Attitude
  } deriving (Show, Eq)

-- | Game status
data Status = Status
  { activePlayers :: [Player]
  , deadPlayers   :: [Player]
  , nextPlayer    :: Player  -- ^ Next to play.
  , gamePhase     :: GPhase
  } deriving (Show, Eq)

-- | Game logs.
newtype Log = Log Text

-- | Game state.
newtype GST a = GST {runGST :: Status -> (a, Status)}

instance Functor GST where
  fmap f aG = GST  $ \s -> case runGST aG s of
    (a, s1) -> (f a, s1)

instance Applicative GST where
  pure a  = GST (a, )
  fG <*> aG = GST $ \s -> case runGST fG s of
    (f, s1) -> case runGST aG s1 of
      (a, s2) -> (f a, s2)

instance Monad GST where
  aG >>= f = GST $ \s -> case runGST aG s of
    (a, s1) -> runGST (f a) s1


-- * Helper Combinators for Execution

initTurn :: GST (IO Log)
initTurn = undefined

endTurn :: GST (IO Log)
endTurn = undefined

drawCards :: GST (IO Log)
drawCards = undefined
