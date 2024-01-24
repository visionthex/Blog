import Html

main = putStrLn (render myhtml)

myhtml :: Html
myhtml =
  html_
    "Hello title"
    (append_ (h1_ "Hello, World?") (p_ "My first blog"))