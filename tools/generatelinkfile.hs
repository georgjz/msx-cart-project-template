-- Glorious Haskell File for Things.
-- {-# LANGUAGE OverloadedStrings #-}
module LinkFileGenerator where 

import Data.List (intercalate)
import Data.List.Split (splitOn)
import System.Environment 
        
    
-- Generate a link file
main :: IO () 
main = do 
    args <- concat <$> getArgs
    let output = (intercalate "\n" . (:) "[objects]" . splitOn ";") args
    writeFile "linkfile.cfg" output