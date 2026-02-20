# Large instance lot sizing
using Random

Random.seed!(37)

# Parameters
products=[i for i=1:100]
J=length(products)
periods=[i for i=1:365]
T=length(periods)
machines=[m for m=1:10]

s0=zeros(J) # initial storage

d = rand(10:80, J, T) # random demand

c = repeat(rand(0.8:0.1:1.2, J), 1, T) # unitary costs
f = repeat(rand(0.2:0.1:0.5, J), 1, T) # inventory holding costs
g = rand(200:500, J, T) # set-up costs



# Capacity
K = 100   # max production per product per period
R = 5000   # max total production per period
Q = 9500   # max total capacity

