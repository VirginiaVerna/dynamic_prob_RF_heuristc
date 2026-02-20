


using CSV, DataFrames

include(joinpath(@__DIR__, "lotsizing_csv.jl"))

df = CSV.read("large_lsp_data.csv", DataFrame)


machines = unique(df.Machine)
products = unique(df.Product)
periods = unique(df.Period)


d = Dict((row.Product, row.Period) => row.Demand for row in eachrow(df))
c = Dict((row.Product, row.Period) => row.Cost for row in eachrow(df))
f = Dict((row.Product, row.Period) => row.Holding for row in eachrow(df))
g = Dict((row.Product, row.Period) => row.Setup for row in eachrow(df))
s0 = Dict(p => df[(df.Product .== p) .& (df.Period .== 1), :s0][1] for p in products)


K = 55  # Large constant for Big-M
R = 100    # Machine capacity per period
Q = 70   # Total storage capacity