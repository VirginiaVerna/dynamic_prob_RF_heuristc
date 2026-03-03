
# TRAIN MAINTENANCE MODEL
# function that extracts binary variables from the model and groups them by blocks of time periods.
# For each time block we consider binary variables that have their "start time" within that block.


# LOGIC:
# For z[j], indices = [j]. Start time is indices[1]
# For y[k, (i, j)], indices = [k, i, j]. Start time is indices[2]
# For x[k, (i, j, l)], indices = [k, i, j, l]. Start time is indices[2]


using JuMP

function binary_var_block_tm(model, blocks)

    # Map that associates each instant t with its block number
    block_of_t = Dict{Int, Int}()
    for (b, block) in enumerate(blocks)
        for t in block
            block_of_t[t] = b
        end
    end

    vars_per_block = [VariableRef[] for _ in 1:length(blocks)]

    for v in all_variables(model)
        if is_binary(v)
            indices = extract_all_indices(v)
            if !isempty(indices)
                
                start_t = (length(indices) == 1) ? indices[1] : indices[2]
                
                if haskey(block_of_t, start_t)
                    push!(vars_per_block[block_of_t[start_t]], v)
                end
            end
        end
    end

    return vars_per_block
end






#------------------------------------------------------

# TRAIN MAINTENANCE MODEL
# funtion that groups varibles by blocks of time periods. For each time block we consider binary variables
# that have their "start time" and  "end time" within that block.

# --- LOGIC ---
# z[j] -> indices = [j]
# y[k, (i, j)] -> indices = [k, i, j]
# x[k, (i, j, l)] -> indices = [k, i, j, l]



#=
using JuMP

function binary_var_block_tm(model, blocks)
    # Map that associates each instant t with its block number
    block_of_t = Dict{Int, Int}()
    for (b, block) in enumerate(blocks)
        for t in block
            block_of_t[t] = b
        end
    end

    vars_per_block = [VariableRef[] for _ in 1:length(blocks)]

    for v in all_variables(model)
        if is_binary(v)
            indices = extract_all_indices(v)
            
            if !isempty(indices)
                
                if length(indices) == 1
                    # z[j]
                    t_start = indices[1]
                    t_end = indices[1]
                else
                    #  x o y
                    t_start = indices[2]
                    t_end = indices[3]
                end

                
                target_blocks = Set{Int}()
                if haskey(block_of_t, t_start)
                    push!(target_blocks, block_of_t[t_start])
                end
                if haskey(block_of_t, t_end)
                    push!(target_blocks, block_of_t[t_end])
                end

                # this way we assign the variable to all blocks that contain either its start or its end time.
                # for example a variable y[k, (i, j)] with start time in block 1 and end time in block 2 will be included in both blocks.
                for b_idx in target_blocks
                    push!(vars_per_block[b_idx], v)
                end
            end
        end
    end
    return vars_per_block
end

=#


# Function that extracts all numbers as an ordered list
function extract_all_indices(v::VariableRef)
    m = name(v)
    matches = eachmatch(r"(\d+)", m)
    return [parse(Int, res.match) for res in matches]
end

