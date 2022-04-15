a_matrix =  [0, 1; 
        2, 1; 
        1, 0]
    

[U, S, V] = svd(a_matrix)

S(2, 2) = 0;

out = U * S * V