hamming :: [Int]
hamming = concat [parcial x | x<-[0..]]

parcial :: Int -> [Int]
parcial n = [2^i * 3^j * 5^k | i<-[0..n], j<-[0..n], k<-[0..n], i+j+k==n]

parcial' :: Int -> [(Int,Int,Int)]
parcial' n = [(i,j,k) | i<-[0..n], j<-[0..n], k<-[0..n], i+j+k==n]

isort :: Ord a => [a] -> [a]
isort = foldr inserir []


inserir :: Ord a => a -> [a] -> [a]
inserir valor [] = [valor]
inserir valor (x:xs) 
                | x < valor = x : inserir valor xs
                | otherwise = valor : (x : xs)