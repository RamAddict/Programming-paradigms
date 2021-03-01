colineares :: (Float, Float) -> (Float, Float) -> (Float, Float) -> Bool
colineares (a,b) (c,d) (e,f) = ((a*d - b*c) == 0) || ((a*f - b*e) == 0) || ((c*f - d*e) == 0)

area :: (Float, Float) -> (Float, Float) -> (Float, Float) -> Float
area (a,b) (c,d) (e,f) = ((a*d - b*c) + (a*f - b*e) + (c*f - d*e))

formaTriangulo :: (Float, Float) -> (Float, Float) -> (Float, Float) -> Maybe Float
formaTriangulo a b c | colineares a b c = Nothing
                     | otherwise = Just (abs $ (area a b c))


main = do
    print (formaTriangulo (1,3)(2,2)(2,2))
    print (formaTriangulo (1,3)(2,2)(2,-2))