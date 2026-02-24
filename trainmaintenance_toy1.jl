# Toy instance train maintenance

using JuMP.Containers

include(joinpath(@__DIR__, "building_functions.jl"))


K=["k1", "k2", "k3"] # set of activities
R=["r1", "r2"] # set of resources
T=10 # time horizon
periods=0:T-1

p_k=[3,2,1] # processing time of activity k
p=DenseAxisArray(p_k, K)
I_k=[4,3,5] # set of ideal intervals for activity k
I=DenseAxisArray(I_k, K)
l_bar=[1,1,0] # operational periods accumulated before the start of the time horizon for each activity k
l_bar=DenseAxisArray(l_bar, K)
U=1000 # downtime cost per unit time


A_t=build_travel_arcs(K,T,I,l_bar)
#println("Travel arcs: ", A_t)
A_m=build_maintenance_arcs(K,T,p)
#println("Maintenance arcs: ", A_m)


C_k=[500,600,400] # cost of performing maintenance on activity k
C_k=DenseAxisArray(C_k, K)
M_costs = build_costs(K, T, I, C_k, A_t)
#println("Costs: ", M_costs)

# resource consumption for each activity k on each resource r
q = [
    1.0  2.0;  
    2.0  0.0;  
    1.0  1.0   
]
q=DenseAxisArray(q, K, R)


Q = DenseAxisArray(zeros(T, length(R)), periods, R)
for j in periods
    Q[j, "r1"] = 5.0  
    Q[j, "r2"] = 3.0  
end



