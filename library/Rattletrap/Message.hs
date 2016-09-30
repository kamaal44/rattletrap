module Rattletrap.Message where

import Rattletrap.Text
import Rattletrap.Word32

import qualified Data.Binary as Binary

data Message = Message
  { messageFrame :: Word32
  , messageName :: Text
  , messageValue :: Text
  } deriving (Eq, Ord, Show)

getMessage :: Binary.Get Message
getMessage = do
  frame <- getWord32
  name <- getText
  value <- getText
  pure Message {messageFrame = frame, messageName = name, messageValue = value}

putMessage :: Message -> Binary.Put
putMessage message = do
  putWord32 (messageFrame message)
  putText (messageName message)
  putText (messageValue message)