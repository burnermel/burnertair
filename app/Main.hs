module Main where

import Control.Monad.Prompt

import qualified Data.Text as T

-- | A test for the @prompt@ package.

main :: IO ()
main = do
  exec a >>= print
  exec b >>= print
  

a :: Prompt String String (Maybe String)
a = Just
  <$> prompt "String:"

exec :: Prompt String String (Maybe String) -> IO (Maybe String)
exec = flip runPromptM $ \str -> putStrLn str >> getLine

b = do
  a
  a
  a
