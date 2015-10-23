--Decay.hs
--Superhero Decision Game
--Author: Derek Chaplin

import System.Console.ANSI

data Menu = Menu {
  text :: String,
  choices :: [String],
  responses :: [Menu]
} deriving (Show)


mainMenu = Menu "Welcome to Decay" ["Start"] [menu1]
endMenu = Menu "You Win! Play Again?" ["Play Again"] [menu1]
menu1 = Menu "You are a superhero. What is your power?" ["Spider-powers", "Invisibility", "I have a lot of money"] [spiderman1, invisible1, batman1]
spiderman1 = Menu "You are Spider-Man, or at least a cheap rip-off of him.\nUsing your spider-senses, speed, and webs, you fight crime and deliver pizzas in New York City.\nYou also used to have an Uncle Ben." ["End"] [endMenu]
invisible1 = Menu "You have the power of invisibility, which could be very dangerous in the wrong hands.\nTry not to get into too much trouble." ["End"] [endMenu]
batman1 = Menu "You are Batman.\nYou have a lot of money but that can't buy your parents back to life.\nInstead you bought some bat-themed gadgets and clean up the streets of Gotham at night." ["End"] [endMenu]

main = do
  printMenu mainMenu

--prints menu and asks for choice then prints next menu
printMenu menu = do 
  putStrLn ((text menu) ++ "\n")
  let indexes = index (choices menu)
  putStrLn "Options:"
  printChoices menu indexes
  putStrLn "\n[Exit] End the game\n"
  putStr "Choice: "
  x <- getLine
  putStrLn ""
  makeChoice x menu indexes
  return undefined  --prints input

--need a way to print and check choice indexes in order to grab response
--also need a way to check if anything other than those choices is entered

makeChoice "Exit" _ _ = return undefined
makeChoice "EXIT" _ _ = return undefined
makeChoice "exit" _ _ = return undefined
makeChoice x menu indexes = do
  let y = (read x)
  if y `elem` indexes
    then do
      putStrLn ("[" ++ x ++ "] " ++ ((choices menu)!!(y-1)))
      putStrLn ("*********")
      printMenu ((responses menu)!!(y-1))
    else do
      putStr ("***Error: Invalid Input***\n")
      printMenu menu

printChoices (Menu _ [] _) _ = return undefined --empty list of choices
printChoices (Menu t (c:cs) rs) (i:is) = do  --anything else, prints choices
  putStr ("[" ++ (show i) ++ "] ")
  putStrLn c --prints a choice, but we want numbers with it
  printChoices (Menu t cs rs) is  --prints next choice, cutting off the head


--returns a list of indexes+1 for an array
index :: [a] -> [Int]
index x = [1 .. length x]

