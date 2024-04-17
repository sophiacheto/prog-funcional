
loop [] z = z 
loop (x:xs) z = loop xs (f z x)


