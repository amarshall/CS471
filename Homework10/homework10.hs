-- 1)
composeHOF = (\list -> foldl1 (.) list)

-- 2)
thuer [] = []
thuer (0:list) = 1 : thuer list
thuer (1:list) = 0 : thuer list
thue list = list ++ thuer list

-- Alternative non-recursive version:
thuem list = list ++ map (\i -> if i == 1 then 0 else 1) list

-- 3)
thueSeq = [0] : [list ++ map (\i -> if i == 1 then 0 else 1) list | list <- thueSeq]

-- 4)
factors n = [f | f <- [1..n], n `mod` f == 0]

-- 5)
merge (a:x) (b:y)
  | a == b = a : merge x y
  | a < b  = a : merge x (b:y)
  | a > b  = b : merge (a:x) y
merge _ _ = []

-- 6)
-- Not complete...
{- hamming = 1 : map (2*) hamming ++ map (3*) hamming ++ map (5*) hamming -}

-- 7)
s8 = map f1 . filter f2
f1 = (+1)
f2 = (>(-1))

-- 8)
sumH n = foldl1 (+) (map (1/) [1..n])

-- 9)
sumlengths list = foldl1 (+) (map length list)
