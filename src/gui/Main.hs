module Main where

import           Graphics.UI.WX

import           System.Environment
import           System.Exit
import           System.Process

import           GHC.IO.Handle

main :: IO ()
main = start gui

gui :: IO ()
gui = do
  f <- frame [text := "flc-gui",position := pt 200 200]
  source <- button f [text := "Compile File", on command := selectFile f]
  set f [layout := margin 50 (floatCentre (widget source))]

selectFile :: Window a -> IO ()
selectFile p = do
  sourcePath <- fileOpenDialog
    p -- parent
    True -- rememberCurrenDir
    True -- allowReadOnly
    "Select File" -- title
    [("Filterscript Files ",["*.fs"]),("Any Files",["*"])] -- file type filters
    "" -- directory
    "" -- filename
  maybe
    (return ())
    (compileFile p)
    sourcePath

compileFile :: Window a -> FilePath -> IO ()
compileFile p path = do
  (_,Just stdout,_,process) <- createProcess =<< compileProcess path
  exitCode <- waitForProcess process
  output <- hGetContents stdout
  case exitCode of
    ExitSuccess -> infoDialog p "Success" output
    ExitFailure _ -> errorDialog p "Error" output

compileProcess :: FilePath -> IO CreateProcess
compileProcess path = do
  currentPath <- getExecutablePath
  return (proc  (flcPath currentPath) [path]) {std_out = CreatePipe}
  where flcPath = reverse.drop (length "-gui").reverse
