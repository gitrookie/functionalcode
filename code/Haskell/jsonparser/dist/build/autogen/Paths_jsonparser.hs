module Paths_jsonparser (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\soodg.AUTH\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\soodg.AUTH\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-7.10.3\\jsonparser-0.1.0.0-H3TOLW0i3agEZY8MO1lX92"
datadir    = "C:\\Users\\soodg.AUTH\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-7.10.3\\jsonparser-0.1.0.0"
libexecdir = "C:\\Users\\soodg.AUTH\\AppData\\Roaming\\cabal\\jsonparser-0.1.0.0-H3TOLW0i3agEZY8MO1lX92"
sysconfdir = "C:\\Users\\soodg.AUTH\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "jsonparser_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "jsonparser_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "jsonparser_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "jsonparser_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "jsonparser_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
