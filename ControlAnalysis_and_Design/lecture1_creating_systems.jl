# using Pkg; Pkg.add("ControlSystemsBase")

using ControlSystemsBase

tf(1, [1, 2])   # Transfer function
"""
TransferFunction{Continuous, ControlSystemsBase.SisoRational{Int64}}
  1
-----
s + 2

Continuous-time transfer function model
"""

s = tf("s")
P = (s + 0.5) / (s^2 + 2s + 1)
C = pid(1, 2)

print(C)

numvec(P)
denvec(P)

numpoly(P)

2P # multiplication by a scalar

inv(P) # inverse

P + C # addition connects systems in parallel

P * C # multiplication connects systems in series

P = ss(P) # Conver to State Space

G1 = P*C / (1 + P*C)

G2 = feedback(P*C)

A = [0 1; -1 -2]
B = [0; 1]
C = [1 0]
D = 0
P = ss(A, B, C, D)

P.A # Access the A matrix