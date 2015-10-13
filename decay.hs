--Decay.hs
--Superhero Decision Game
--Author: Derek Chaplin

--import Char


choices = []

main = do
  putStrLn "Welcome to Decay\n"
  choiceMenu

choiceMenu = do
  putStrLn "Choose a thing:"
  putStrLn "[1] Test"
  putStrLn "[2] Test"
  putStr "Choice: "
  x <- getLine
  putStrLn (choice x)

choice :: String->String
choice input = case input of
  "1" -> "Win"
  "2" -> "Win2"
  _ -> "Error"

  