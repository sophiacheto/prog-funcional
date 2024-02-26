incr :: Int -> Int
incr x = x+1
triple :: Int -> Int
triple x = 3*x
welcome :: String -> String
welcome name = "Hello, " ++ name ++ "!"
count :: String -> String
count str = show (length str) ++ " characters."


-- incr (triple 3) -- 10
-- triple (incr (3+1)) -- 15
--  triple (incr 3 + 1) -- 15
-- triple (incr 3) + 1 -- 13
-- welcome "Harry" ++ welcome "Potter" -- "Hello, Harry!Hello, Potter!"
-- welcome ("Harry" ++ " Potter") -- "Hello, Harry Potter!"
-- welcome (welcome "Potter") -- "Hello, Hello, Potter!!"
-- count "Expelliarmus!" -- "13 characters."
-- count (count "Expelliarmus!") -- "14 characters."