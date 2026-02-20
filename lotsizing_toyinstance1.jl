# INSTANCE LOT SIZING TOY EXAMPLE



using JuMP, Gurobi, CSV, DataFrames


df = CSV.read("lotsizing_toydata.csv", DataFrame)

machines = sort(unique(df.Machine))
products = sort(unique(df.Product))
periods  = sort(unique(df.Period))


d = [df[(df.Product .== p) .& (df.Period .== t), :Demand][1] for p in products, t in periods]
c = [df[(df.Product .== p) .& (df.Period .== t), :Cost][1] for p in products, t in periods]
f = [df[(df.Product .== p) .& (df.Period .== t), :Holding][1] for p in products, t in periods]
g = [df[(df.Product .== p) .& (df.Period .== t), :Setup][1] for p in products, t in periods]


s0 = df[df.Period .== 1, :s0]


K = 10
R = 20
Q = 17

