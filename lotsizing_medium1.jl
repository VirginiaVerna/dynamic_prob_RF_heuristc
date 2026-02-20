# LOT SIZING PROBLEM - medium 

using Random


Random.seed!(123)

products=["product_$i" for i=1:20]
J=length(products)
periods=[i for i=1:52]
T=length(periods)
machines=["machine_$m" for m=1:5]

s0=rand(3:7,J) # initial storage

d = rand(10:80, J, T) # random demand

c = repeat(rand(0.8:0.1:1.2, J), 1, T) # unitary costs
f = repeat(rand(0.2:0.1:0.5, J), 1, T) # inventory holding costs
g = rand(200:500, J, T) # set-up costs

c = DenseAxisArray(c, products, periods)
g = DenseAxisArray(g, products, periods)
f = DenseAxisArray(f, products, periods)
d = DenseAxisArray(d, products, periods)
s0 = DenseAxisArray(s0, products)


# Capacity
K = 95   # max production per product per period
R = 1200   # max total production per period
Q = 2000   # max total capacity
