a = rand(5, 3)
b = rand(5, 3)

cov_ab = cov(a, b)
cov_ab1 = cov(a', b')
cov_aa = cov(a', a')
cov_a = cov(a)
cov_ap = cov(a')