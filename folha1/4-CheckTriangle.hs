checkTriangle :: Float -> Float -> Float -> Bool
checkTriangle a b c = (a<b+c) && (b<a+c) && (c<a+b)