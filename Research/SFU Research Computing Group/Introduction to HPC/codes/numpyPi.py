import numpy as np

n = int(1e10)
k = np.arange(n)
sum = np.sum(4./(1.+((k+0.5)/n)**2)) / n
print(sum, abs(sum-np.pi))
