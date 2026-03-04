# Toy instance train maintenance

using JuMP.Containers, Random

include(joinpath(@__DIR__, "building_functions.jl"))

Random.seed!(89)

K=["k1", "k2", "k3"] # set of activities
R=["r1", "r2"] # set of resources
T=15 # time horizon
periods=0:T-1


p_k=[rand(2:4) for k in K]
p=DenseAxisArray(p_k, K)

I_k=[rand(8:10) for k in K]
I=DenseAxisArray(I_k, K)

l_bar=[rand(1:2) for k in K]
l_bar=DenseAxisArray(l_bar, K)

U=3000

A_t=build_travel_arcs(K,T,I,l_bar)
#println("Travel arcs: ", A_t)
A_m=build_maintenance_arcs(K,T,p)
#println("Maintenance arcs: ", A_m)


# cost of performing maintenance on activity k
C_k=[rand(400:100:600) for k in K]
C_k=DenseAxisArray(C_k, K)
M_costs = build_costs(K, T, I, C_k, A_t)
#println("Costs: ", M_costs)

# resource consumption for each activity k on each resource r

q=[rand(1.0:1:3.0) for k in K, r in R]
q=DenseAxisArray(q, K, R)


Q = DenseAxisArray(zeros(T, length(R)), periods, R)
for j in periods
    Q[j, "r1"] = rand(3:5)  
    Q[j, "r2"] = rand(2:4)  
end




