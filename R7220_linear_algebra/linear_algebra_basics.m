a_matrix =  [0, 1; 
        2, 1; 
        1, 0]
a_rank = rank(a_matrix)
a_reshaped = reshape(a_matrix, [2, 3])
c_matrix = a_matrix*a_matrix'
c_trace = trace(c)
c_determinant = det(c)
[u_matrix, s_matrix, v_matrix] = svd(a_matrix)


