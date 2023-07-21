{-# LANGUAGE TupleSections #-}

module Game where


import Data.Text (Text)

import Card
import Character


-- * Game State & Logs

-- | Players
data Player = Player
  { plChar :: Character
  , plDraw :: [Card]
  , plDisc :: [Card]
  , plHand :: [Card]
  } deriving (Show, Eq)

-- | Game status
data Status = Status
  { activePlayers :: [Player]
  , deadPlayers   :: [Player]
  , nextPlayer    :: Player  -- ^ Next to play a card
  } deriving (Show, Eq)

-- | Game logs
newtype Log = Log Text

-- | Game state
newtype GST a = GST {runGST :: Status -> (a, Status)}

instance Functor GST where
  fmap f (GST run) = GST  $ \s -> case run s of
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
