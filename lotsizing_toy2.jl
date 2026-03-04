# LOT SIZING TOY INSTANCE 2

using JuMP.Containers, Random

Random.seed!(125)


products=["sugar", "salt", "pepper", "oil"]
periods=[1,2,3,4,5,6,7,8,9,10,11,12]
machines=["machine1","machine2"]

# sparse demand
d=[rand() < 0.4 ? rand(18.0:2.0:30.0) : 0.0 for j in 1:length(products), t in 1:length(periods)]

# unit production cost
c=[rand(10:2:20) for j in 1:length(products), t in 1:length(periods)]

# setup cost
g=[rand(100:50:300) for j in 1:length(products), t in 1:length(periods)]

# inventory cost
f=[rand(0.3:0.2:1.5) for j in 1:length(products), t in 1:length(periods)]

# initial inventory
s0=[rand(0.0:1.0:2.0) for j in 1:length(products)]

c = DenseAxisArray(c, products, periods)
g = DenseAxisArray(g, products, periods)
f = DenseAxisArray(f, products, periods)
d = DenseAxisArray(d, products, periods)
s0 = DenseAxisArray(s0, products)


R=27
K=20
Q=25
