# Medium instance train maintenance

using JuMP.Containers, Random

include(joinpath(@__DIR__, "building_functions.jl"))


Random.seed!(67)


K=["k$i" for i in 1:6] # set of activities
R=["r$i" for i in 1:3] # set of resources
T=52 # time horizon
periods=0:T-1

p = rand(1:5, length(K))
p = DenseAxisArray(p, K)


I = rand(10:15, length(K))
I = DenseAxisArray(I, K)


l_bar = [rand(0:I[k]) for k in K]
l_bar = DenseAxisArray(l_bar, K)


U = 700 


A_t = build_travel_arcs(K, T, I, l_bar)
A_m = build_maintenance_arcs(K, T, p)


C_k = rand(300:800, length(K))
C_k = DenseAxisArray(C_k, K)

M_costs = build_costs(K, T, I, C_k, A_t)


q = [rand() < 0.5 ? rand(1.0:0.5:4.0) : 0.0 for k in 1:length(K), r in 1:length(R)]
q = DenseAxisArray(q, K, R)


Q = DenseAxisArray(zeros(T, length(R)), periods, R)
for r in R
    capacity = rand(8.0:1.0:15.0)
    for t in periods
        Q[t, r] = capacity
    end
end

