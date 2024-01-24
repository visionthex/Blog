module Html.Internal where

html_ :: Title -> Structure -> Html
html_ title (Structure content) =
  Html (el "head" (el "title" (escape title)) <> el "body" content)

h1_ :: String -> Structure
h1_ = Structure . el "h1" . escape

code_ :: String -> Structure
code_ = Structure . el "pre" . escape

p_ :: String -> Structure
p_ = Structure . el "p" . escape

ul_ :: [Structure] -> Structure
ul_ =
  Structure . el "ul" . concat . map (el "li" . getStructureString)

ol_ :: [Structure] -> Structure
ol_ =
  Structure . el "ol" . concat . map (el "li" . getStructureString)

el :: String -> String -> String
el tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

newtype Html = Html String

newtype Structure = Structure String

type Title = String

getStructureString :: Structure -> String
getStructureString (Structure s) = s

append_ :: Structure -> Structure -> Structure
append_ (Structure first) (Structure second) =
  Structure (first <> second)

render :: Html -> String
render (Html html) = html

escape :: String -> String
escape =
  let
    escapeChar c =
      case c of
        '<' -> "&lt;"
        '>' -> "&gt;"
        '&' -> "&amp;"
        '"' -> "&quot;"
        '\'' -> "&#39;"
        _ -> [c]
  in
  concat . map escapeChar