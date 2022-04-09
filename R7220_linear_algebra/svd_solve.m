aaa =  [0, 1; 
        2, 1; 
        1, 0]
    
b = reshape(aaa, [2, 3])
c = aaa*aaa'
d = trace(c)
e = det(c)
[u, s, v] = svd(aaa)

a_rank = rank(aaa)
