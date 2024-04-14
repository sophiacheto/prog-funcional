leftHalf :: [Int] -> [Int]
leftHalf xs = take (length xs `div` 2) xs

rightHalf :: [Int] -> [Int]
rightHalf xs = drop (length xs `div` 2) xs