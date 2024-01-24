module Blog
  (
    convertSingle
  , convertDirectory
  , process
  )
  where

import qualified Blog.Html as Html
import qualified Blog.Markup as Markup
import Blog.Convert (convert)

import System.IO

convertSingle :: Html.Title -> Handle -> Handle -> IO ()
convertSingle title input output = do
  content <- hGetContents input
  hPutStr output (process title content)

convertDirectory :: filePath -> filePath -> IO ()
convertDirectory = error "Noot implemented"

process :: Html.Title -> String -> String
process title = Html.render .convert title . Markup.parse