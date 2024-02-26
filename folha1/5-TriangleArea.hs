triangleArea :: Float -> Float -> Float -> Float
triangleArea a b c = sqrt(s * (s-a) * (s-b) * (s-c))
    where s = (a+b+c)/2