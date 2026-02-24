# LOT SIZING MODEL



using JuMP, Gurobi

include(joinpath(@__DIR__, "lotsizing_toy1.jl"))
#include(joinpath(@__DIR__, "lotsizing_medium1.jl"))
#include(joinpath(@__DIR__, "lotsizing_large1.jl"))

include(joinpath(@__DIR__, "partition_period.jl"))
include(joinpath(@__DIR__, "binary_var_block_ls.jl"))
include(joinpath(@__DIR__, "relax_and_fix.jl"))



LSP=Model(Gurobi.Optimizer)
set_attribute(LSP, "OutputFlag", 1)
set_attribute(LSP, "TimeLimit", 2100.0)
#set_attribute(LSP, "TimeLimit", 2700.0)


# Variables

@variable(LSP, x[machines, products, t in periods]>=0)
@variable(LSP, y[machines, products, t in periods], Bin)
@variable(LSP, s[products, t in periods]>=0)

# Objective
@objective(LSP, Min, sum(c[j,t]*x[i,j,t]+g[j,t]*y[i,j,t] for i in machines, j in products, t in periods)+sum(f[j,t]*s[j,t] for j in products, t in periods))


# Constraints
@constraint(LSP, [j in products, t in periods], s[j,t]==(t>1 ? s[j,t-1] : s0[j]) + sum(x[i,j,t] for i in machines) - d[j,t])

@constraint(LSP, [t in periods], sum(s[j,t] for j in products)<=Q)

@constraint(LSP, [i in machines, j in products, t in periods], x[i,j,t]<=K*y[i,j,t])

@constraint(LSP, [i in machines, t in periods], sum(x[i,j,t] for j in products)<=R)

@constraint(LSP, [j in products], s[j, last(periods)] == s0[j])



# -------- GUROBI ------------
optimize!(LSP)
println("Termination status: $(termination_status(LSP))")

gurobi_cost=round(objective_value(LSP), digits=2)
best_bound=round(objective_bound(LSP), digits=2) 




# -------- RELAX AND FIX -----------
blocks=partition_period(periods, 2)
#blocksprintln("\nBlocks: ", blocks)
#blocks=partition_period(last(periods), 7)
#blocks=partition_period(last(periods), 30)

binary_blocks=binary_var_block_ls(LSP, blocks)


rf_solution, rf_cost=relax_and_fix(LSP, blocks, binary_blocks)





# ----- RESULTS -------

println("\n" * "="^40)
println("      RESULTS")
println("="^40)
println("Gurobi objective: ", gurobi_cost)
println("Gurobi best bound: ", best_bound)
println("Relax and fix objective: ", round(rf_cost, digits=2))
println("="^40)
