module Main where

import           EmbeddedLootLanguage
import           LootScriptLanguage
import           System.Environment   (getArgs)
import           System.Exit

type OutputName = FilePath

main :: IO ()
main = do
    args <- getArgs
    runMain args

runMain :: [String] -> IO ()
runMain args =
    if null args
    then abortWithError "no source file specified"
    else do
      ppResult <- readFile sourcePath >>= preProcessor
      eitherDoOrError (writeFilter outputName) $ ppResult >>= translateProgram sourcePath
    where sourcePath = arg 0
          outputName | (length args < 3) || not outFlag = "out"
                     | otherwise = arg 2
          outFlag = arg 1 == "-o"
          arg = (args !!)
          eitherDoOrError = either abortWithError

writeFilter :: OutputName -> Filter -> IO ()
writeFilter path x = do
  writeFile file $ credits ++ show x
  putStrLn $ "filter compilation finished"
  exitSuccess
  where file = path ++ ".filter"

credits = "# filter generated by flc" ++ newline
       ++ "# manual editing is not recommended" ++ newline

abortWithError :: String -> IO ()
abortWithError s = do
  putStrLn $ "filter compilation failed" ++ newline ++ "Error: " ++ s
  exitFailure

newline = "\n"
