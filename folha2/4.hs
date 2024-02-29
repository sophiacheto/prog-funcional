classifica :: Int -> String
classifica x | x <= 9 = "reprovado"
             | x <= 12 = "suficiente"
             | x <= 15 = "bom"
             | x <= 18 = "muito bom"
             | x <= 20 = "muito bom com distinção"
             | otherwise = "nada"
