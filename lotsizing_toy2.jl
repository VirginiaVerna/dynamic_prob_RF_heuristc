# LOT SIZING TOY INSTANCE 2

using JuMP.Containers, Random

Random.seed!(125)


products=["sugar", "salt", "pepper", "oil"]
periods=[1,2,3,4,5,6,7,8,9,10,11,12]
machines=["machine1", "machine2", "machine3"]

# sparse demand
d=[rand() < 0.4 ? rand(5.0:1.0:10.0) : 0.0 for j in 1:length(products), t in 1:length(periods)]
c=[rand(1:1:4) for j in 1:length(products), t in 1:length(periods)]
g=[rand(100:100:300) for j in 1:length(products), t in 1:length(periods)]
f=[rand(3:1:5) for j in 1:length(products), t in 1:length(periods)]
s0=[rand(1.0:1.0:3.0) for j in 1:length(products)]

c = DenseAxisArray(c, products, periods)
g = DenseAxisArray(g, products, periods)
f = DenseAxisArray(f, products, periods)
d = DenseAxisArray(d, products, periods)
s0 = DenseAxisArray(s0, products)


R=20
K=11
Q=20
