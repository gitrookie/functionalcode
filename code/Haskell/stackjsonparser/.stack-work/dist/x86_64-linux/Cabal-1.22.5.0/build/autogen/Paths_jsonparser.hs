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

bindir     = "/home/gaurav/Documents/Programming/Haskell/jsonparser/.stack-work/install/x86_64-linux/lts-6.7/7.10.3/bin"
libdir     = "/home/gaurav/Documents/Programming/Haskell/jsonparser/.stack-work/install/x86_64-linux/lts-6.7/7.10.3/lib/x86_64-linux-ghc-7.10.3/jsonparser-0.1.0.0-H3TOLW0i3agEZY8MO1lX92"
datadir    = "/home/gaurav/Documents/Programming/Haskell/jsonparser/.stack-work/install/x86_64-linux/lts-6.7/7.10.3/share/x86_64-linux-ghc-7.10.3/jsonparser-0.1.0.0"
libexecdir = "/home/gaurav/Documents/Programming/Haskell/jsonparser/.stack-work/install/x86_64-linux/lts-6.7/7.10.3/libexec"
sysconfdir = "/home/gaurav/Documents/Programming/Haskell/jsonparser/.stack-work/install/x86_64-linux/lts-6.7/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "jsonparser_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "jsonparser_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "jsonparser_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "jsonparser_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "jsonparser_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
