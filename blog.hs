import Html

main = putStrLn (render myhtml)

myhtml :: Html
myhtml =
  html_
    "Hello title"
    (append_
      (h1_ "Hello world")
      (append_
        (p_ "My first blog")
        (p_ "My second blog")
      )
    )