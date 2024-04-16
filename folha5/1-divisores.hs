divisores :: Int -> [Int]
divisores x = filter (\n -> x`mod`n==0) [1..x]