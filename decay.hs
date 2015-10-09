--Decay.hs
--Superhero Decision Game
--Author: Derek Chaplin

main = do
	putStrLn "Welcome to Decay\n"
	menu

menu = do
	putStrLn "Choose a thing:"
	putStrLn "[1] Test"
	putStrLn "[2] Test"
	putStrLn "[3] Test"
	putStr "Choice: "
	choice <- getLine
	putStrLn ("You chose " ++ choice)

