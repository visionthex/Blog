main = putStrLn (render myhtml)

myhtml :: Html
myhtml =
  html_
    "Hello title"
    (append_ (h1_ "Hello, World?") (p_ "My first blog"))

html_ :: Title -> Structure -> Html
html_ title (Structure content) =
  Html (el "head" (el "title" title) <> el "body" content)

h1_ :: String -> Structure
h1_ = Structure . el "h1"

p_ :: String -> Structure
p_ = Structure . el "p"

el :: String -> String -> String
el tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

newtype Html = Html String

newtype Structure = Structure String

type Title = String

append_ :: Structure -> Structure -> Structure
append_ (Structure first) (Structure second) =
  Structure (first <> second)

render :: Html -> String
render (Html html) = html