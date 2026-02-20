# Lot sizing toy INSTANCE 2


using JuMP.Containers

#=
products=["banana", "apple", "orange"]
periods=[1,2,3,4,5,6,7,8,9,10]
machines=["m1"]
=#

products=[1,2,3]
periods=[1,2,3,4,5,6,7,8,9,10]
machines=[1]


d = [5 5 5 5 5 5 5 5 5 5;
    3 3 3 3 3 3 3 3 3 3;
    4 4 4 4 4 4 4 4 4 4]
c = [2 2 2 2 2 2 2 2 2 2;
    3 3 3 3 3 3 3 3 3 3;
    1 1 1 1 1 1 1 1 1 1]
f = [0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5;
    0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3;
    0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4]
g = [10 10 10 10 10 10 10 10 10 10;
    8 8 8 8 8 8 8 8 8 8;
    6 6 6 6 6 6 6 6 6 6]
s0 = [10.0, 2.0, 4.0]



c = DenseAxisArray(c, products, periods)
g = DenseAxisArray(g, products, periods)
f = DenseAxisArray(f, products, periods)
d = DenseAxisArray(d, products, periods)
s0 = DenseAxisArray(s0, products)

K = 10
R = 20
Q = 17