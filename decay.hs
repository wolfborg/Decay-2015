--Decay.hs
--Superhero Decision Game
--Author: Derek Chaplin


data Menu = Menu {
  text :: String,
  choices :: [String],
  responses :: [Menu]
} deriving (Show)


mainMenu = Menu "Welcome to Decay" ["Start"] [startMenu]
startMenu = Menu "You Win. Play Again?" ["Back"] [mainMenu]

main = do
  printMenu mainMenu
  

printMenu menu = do 
  putStrLn (text menu)
  printChoices menu
  putStr "Choice: "
  x <- getLine
  let y = choice menu x
  if y == "Error"
    then printMenu menu
    else putStrLn y

printChoices (Menu _ [] _) = return undefined
printChoices (Menu t (c:cs) rs) = do
  putStrLn c
  printChoices (Menu t cs rs)

choice menu "1" = "test"
--choice menu "2" = ""
choice menu x = "Error"