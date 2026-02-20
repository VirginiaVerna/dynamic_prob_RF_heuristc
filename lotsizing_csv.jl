# CODE THAT GENERATES THE CSV DATASET 


using CSV, DataFrames, Random

num_machines = 10
num_products = 50
num_periods = 100

# Pre-allocate arrays for better performance
total_rows = num_machines * num_products * num_periods
machines = Vector{Int}(undef, total_rows)
products = Vector{Int}(undef, total_rows)
periods = Vector{Int}(undef, total_rows)
demand = Vector{Int}(undef, total_rows)
cost = Vector{Int}(undef, total_rows)
holding = Vector{Float64}(undef, total_rows)
setup = Vector{Int}(undef, total_rows)
s0 = Vector{Float64}(undef, total_rows)

idx = 1
for m in 1:num_machines
    for p in 1:num_products
        # Define product-specific constants for this machine-product pair
        p_demand = rand(1:10)
        p_cost = rand(1:5)
        p_holding = round(rand() * 0.7 + 0.1, digits=2)
        p_setup = rand(5:20)
        p_initial_stock = round(rand() * 15.0, digits=1)

        for t in 1:num_periods
            machines[idx] = m
            products[idx] = p
            periods[idx] = t
            demand[idx] = p_demand
            cost[idx] = p_cost
            holding[idx] = p_holding
            setup[idx] = p_setup
            # s0 is only > 0 in the first period
            s0[idx] = (t == 1) ? p_initial_stock : 0.0
            
            global idx += 1
        end
    end
end

# Create the DataFrame
df = DataFrame(
    Machine = machines,
    Product = products,
    Period = periods,
    Demand = demand,
    Cost = cost,
    Holding = holding,
    Setup = setup,
    s0 = s0
)


CSV.write("large_lsp_data.csv", df)