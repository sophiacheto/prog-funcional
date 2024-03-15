toBits :: Int -> [Int] 
toBits 0 = []
toBits n = toBits (n`div`2) ++ [n`mod`2]