# BUILDING FUNCTIONS: Functions to build the travel arcs, maintenance arcs, and cost parameters

using JuMP.Containers

#------- TRAVEL ARCS -------
# Container for (i, j, l) tuples
function build_travel_arcs(K, T, I, l_bar)
    A_t = Containers.DenseAxisArray{Vector{Tuple}}(undef, K)
    for k in K
        arcs = Tuple[]

        # --- A_t1 ---
        for i in 0:T-1
            for j in (i+1):T-1

                # Calculate max allowed operational time l
                upper_l = (i == 0) ? (I[k] - l_bar[k]) : I[k]
                
                # l must be <= upper_l and cannot exceed the actual time elapsed (j-i)
                for l in 0:min(upper_l, j - i)
                    push!(arcs, (i, j, l))
                end
            end
        end
        
        # --- A_t2 ---
        for i in max(0, T - I[k]):T-1  # max(0,...) in case I[k] > T ()
            push!(arcs, (i, "T", I[k]))
        end
        
        A_t[k] = arcs
    end
    return A_t
end



#------- MAINTENANCE ARCS -------

# Container for (i, j) tuples
function build_maintenance_arcs(K, T, p)
    A_m = Containers.DenseAxisArray{Vector{Tuple}}(undef, K)
    
    for k in K
        arcs = Tuple[]
        duration = p[k]
        
        for i in 0:T-1
            j = i + duration
            if j <= T
                push!(arcs, (i, j))
            end
        end
        
        A_m[k] = arcs
    end
    return A_m
end


#------------ MAINTENANCE COSTS ------------

# Dictionary to hold costs for each arc (i, j, l) in A_t
function build_costs(K, T, I, C_k, A_t)
    M = Containers.DenseAxisArray{Dict{Tuple, Float64}}(undef, K)
    
    for k in K
        cost_dict = Dict{Tuple, Float64}()
        for arc in A_t[k]
            i, j, l = arc
            
            if j == "T"
                # Arcs towards the sink
                M_val = C_k[k] * (T - i) / I[k]
            else
                # Internal arcs
                M_val = C_k[k] * l / I[k]
            end
            
            cost_dict[arc] = M_val
        end
        M[k] = cost_dict
    end
    return M
end