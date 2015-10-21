--Decay.hs
--Superhero Decision Game
--Author: Derek Chaplin


data Menu = Menu {
  text :: String,
  choices :: [String],
  responses :: [Menu]
} deriving (Show)


mainMenu = Menu "Welcome to Decay" ["Start", "End","Test"] [startMenu]
startMenu = Menu "You Win. Play Again?" ["Back"] [mainMenu]

main = do
  printMenu mainMenu

--prints menu and asks for choice then prints next menu
printMenu menu = do 
  putStrLn (text menu)
  let indexes = index (choices menu)
  printChoices menu indexes
  putStr "Choice: "
  x <- getLine
  makeChoice x menu indexes
  return undefined  --prints input

--need a way to print and check choice indexes in order to grab response
--also need a way to check if anything other than those choices is entered

makeChoice x menu indexes = do
  let y = (read x)
  if y `elem` indexes
    then printMenu ((responses menu)!!(y-1))
    else putStrLn "Error"; printMenu menu

printChoices (Menu _ [] _) _ = return undefined --empty list of choices
printChoices (Menu t (c:cs) rs) (i:is) = do  --anything else, prints choices
  putStr ("[" ++ (show i) ++ "] ")
  putStrLn c --prints a choice, but we want numbers with it
  printChoices (Menu t cs rs) is  --prints next choice, cutting off the head

--returns a list of indexes+1 for an array
index :: [a] -> [Int]
index x = [1 .. length x]

