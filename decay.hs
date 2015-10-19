--Decay.hs
--Superhero Decision Game
--Author: Derek Chaplin


data Menu = Menu {
  text :: String,
  choices :: [String],
  responses :: [Menu]
} deriving (Show)


mainMenu = Menu "Welcome to Decay" [] [startMenu]
startMenu = Menu "You Win. Play Again?" ["Back"] [mainMenu]

main = do
  printMenu mainMenu
  x <- getLine
  let y = choice mainMenu x
  if y == "Error"
    then printMenu mainMenu
    else putStrLn y


printMenu menu = do 
  putStrLn (text menu)
  printChoices menu
  putStr "Choice: "

printChoices (Menu _ [] _) = return undefined
printChoices (Menu t (c:cs) rs) = do
  putStrLn c
  printChoices (Menu t cs rs)

choice menu "1" = ""
choice menu "2" = ""
choice menu x = "Error"