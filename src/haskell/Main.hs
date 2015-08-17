module Main where

import           Data.Version         (showVersion)
import           Paths_FilterScript   (version)

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
  case args of
    [] -> abortWithError "no source file specified"
    ["--version"] -> putStrLn $ showVersion version
    [src] -> compile src $  (fst.dropExt) src ++ ".filter"
    [src,"-o",dest] -> compile src dest
    _ -> abortWithError "unrecognized arguments"
    where dropExt = span (/= '.')

compile :: FilePath -> FilePath -> IO ()
compile src dest = do
  ppResult <- preProcessor =<< readFile src
  eitherDoOrError
    (writeFilter dest)
    (ppResult >>= translateProgram src)
  where eitherDoOrError = either abortWithError


writeFilter :: OutputName -> Filter -> IO ()
writeFilter path x = do
  writeFile file $ credits ++ show x
  putStrLn "filter compiled successfully"
  exitSuccess
  where file = path ++ ".filter"

credits = "# filter generated by flc" ++ newline
       ++ "# manual editing is not recommended" ++ newline

abortWithError :: String -> IO ()
abortWithError s = do
  putStrLn $ "filter compilation failed" ++ newline ++ "Error: " ++ s
  exitFailure


newline = "\n"
