import Html
import Markup

main = putStrLn (render myhtml)

myhtml :: Html
myhtml =
  html_
  "Hello title"
  (append_ (h1_ "Hello, world!") (p_ "My firt blog"))

myDocument :: Document
myDocument =
  [ Heading 1 "Compiling programs with ghc"
  , Paragraph "Running ghc invokes to compile Haskell modules and programs into native"
  , Paragraph "and can be used to compile Haskell modules and programs into native"
  , Paragraph "executables and libraries."
  , CodeBlock ["main = putStrLn \"Hello, Haskell!\""]
  , Paragraph "Now, we can compile the program by invoking ghc with the file name:"
  , CodeBlock
    [ "-> ghc hello.hs"
    , "[1 of 1] Compiling Main ( hello.hs, hello.o )"
    , "Linking hello ..."
    ]
  , Paragraph "GHC created the following files:"
  , UnorderedList
    [ "hello.h1 - Haskell interface file"
    , "hello.o - Object file, the output of the compiler before linking"
    , "hello (or hello.exe on Microsoft Windows) - A native runnable executable."
    ]
  , Paragraph "GHC will produce an executable when the source file satisfies both conditions:"
  , OrderedList
    [ "Defines the main function in the source file"
    , "Defines the module name to be Main or does no have a module declaration"
    ]
  , Paragraph "Otherwise, it will only produce the .o and .hi files."
  ]
