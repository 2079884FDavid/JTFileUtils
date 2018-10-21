module JTFileUtils.JSON
( loadJSON
) where

import Data.Aeson
import qualified Data.ByteString.Lazy as B

checkOK :: FilePath -> Maybe a -> IO a
checkOK _ (Just o) = return o
checkOK p Nothing  = fail ("Could not load JSON from file: "++p)

loadJSON :: FromJSON a => FilePath -> IO a
loadJSON p = do
  st <- decode <$> B.readFile p
  checkOK p st
