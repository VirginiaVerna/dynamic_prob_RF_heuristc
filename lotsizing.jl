# LOT SIZING MODEL



using JuMP, Gurobi

#include(joinpath(@__DIR__, "lotsizing_toy1.jl"))
include(joinpath(@__DIR__, "lotsizing_toy2.jl"))
#include(joinpath(@__DIR__, "lotsizing_toy3.jl"))
#include(joinpath(@__DIR__, "lotsizing_toy4.jl"))
#include(joinpath(@__DIR__, "lotsizing_medium1.jl"))
#include(joinpath(@__DIR__, "lotsizing_medium2.jl"))
#include(joinpath(@__DIR__, "lotsizing_large1.jl"))

include(joinpath(@__DIR__, "partition_period.jl"))
include(joinpath(@__DIR__, "binary_var_block_ls.jl"))
include(joinpath(@__DIR__, "relax_and_fix.jl"))
include(joinpath(@__DIR__, "save_ls_solution.jl"))



LSP=Model(Gurobi.Optimizer)
set_attribute(LSP, "OutputFlag", 1)
set_attribute(LSP, "TimeLimit", 300.0)
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



write_to_file(LSP, "lotsizing.lp")



# -------- GUROBI ------------
optimize!(LSP)
println("Termination status: $(termination_status(LSP))")

gurobi_cost=round(objective_value(LSP), digits=2)
best_bound=round(objective_bound(LSP), digits=2) 

# save gurobi solution
if termination_status(LSP) == OPTIMAL || termination_status(LSP) == TIME_LIMIT
    save_ls_solution("gurobi_solution.csv", machines, products, periods; model=LSP)
end

# Optimal solution details

if termination_status(LSP) == MOI.OPTIMAL
    println("RESULTS: ")
    println("Objective: $(objective_value(LSP))")
        for t in periods
        println("Period ", t)
        println("-------------------------")
        for j in products
            s_val = value(s[j, t])
            println("Product ", j)
            println("  Stock = ", s_val)
            for i in machines
                x_val = value(x[i, j, t])
                y_val = value(y[i, j, t])
                println("    Machine ", i,
                            ", production = ", x_val,
                            ", setup = ", y_val
                )
            end
        end
        println()
    end
else
    println("No solution")
end
        



# -------- RELAX AND FIX -----------
blocks=partition_period(periods, 3) # toy instance
#blocks=partition_period(periods, 10) # medium instance
#blocks=partition_period(periods, 30)

binary_blocks=binary_var_block_ls(LSP, blocks)


rf_solution, rf_cost=relax_and_fix(LSP, blocks, binary_blocks)

# save RF solution
if rf_solution !== nothing
    save_ls_solution("relax_fix_solution.csv", machines, products, periods; rf_sol=rf_solution)
else
    println("Relax and Fix did not find a feasible solution.")
end


# ----- RESULTS -------

println("\n" * "="^40)
println("      RESULTS")
println("="^40)
println("Gurobi objective: ", gurobi_cost)
println("Gurobi best bound: ", best_bound)
println("Relax and fix objective: ", round(rf_cost, digits=2))
println("Gurobi gap: ", round(100*abs(gurobi_cost - rf_cost)/max(abs(gurobi_cost), abs(rf_cost)), digits=2), "%")
println("="^40)


#=
println("\nGenerating plots...")
include("visualize_ls_gurobi.jl")

generate_comparison_plots("gurobi_solution.csv", "relax_fix_solution.csv")
=#