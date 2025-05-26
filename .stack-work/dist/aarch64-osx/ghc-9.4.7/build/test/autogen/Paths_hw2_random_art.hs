{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_hw2_random_art (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/anthonycarmona/cse114a/02-random-art-anthony/.stack-work/install/aarch64-osx/40455f1dd9e85b6fd3093a9c78b76a5e40db6d4140b079e218662d7101d1f587/9.4.7/bin"
libdir     = "/Users/anthonycarmona/cse114a/02-random-art-anthony/.stack-work/install/aarch64-osx/40455f1dd9e85b6fd3093a9c78b76a5e40db6d4140b079e218662d7101d1f587/9.4.7/lib/aarch64-osx-ghc-9.4.7/hw2-random-art-0.1.0.0-JVhxschQup63A8lWlKUbtw-test"
dynlibdir  = "/Users/anthonycarmona/cse114a/02-random-art-anthony/.stack-work/install/aarch64-osx/40455f1dd9e85b6fd3093a9c78b76a5e40db6d4140b079e218662d7101d1f587/9.4.7/lib/aarch64-osx-ghc-9.4.7"
datadir    = "/Users/anthonycarmona/cse114a/02-random-art-anthony/.stack-work/install/aarch64-osx/40455f1dd9e85b6fd3093a9c78b76a5e40db6d4140b079e218662d7101d1f587/9.4.7/share/aarch64-osx-ghc-9.4.7/hw2-random-art-0.1.0.0"
libexecdir = "/Users/anthonycarmona/cse114a/02-random-art-anthony/.stack-work/install/aarch64-osx/40455f1dd9e85b6fd3093a9c78b76a5e40db6d4140b079e218662d7101d1f587/9.4.7/libexec/aarch64-osx-ghc-9.4.7/hw2-random-art-0.1.0.0"
sysconfdir = "/Users/anthonycarmona/cse114a/02-random-art-anthony/.stack-work/install/aarch64-osx/40455f1dd9e85b6fd3093a9c78b76a5e40db6d4140b079e218662d7101d1f587/9.4.7/etc"

getBinDir     = catchIO (getEnv "hw2_random_art_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "hw2_random_art_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "hw2_random_art_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "hw2_random_art_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hw2_random_art_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hw2_random_art_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
