# FOR LOT SIZING

# binary_var_block_ls : it groups each variable into its corresponding time-based block.
# join_data_from_variable_ls : it extracts the time index from the variable name. We assume that it is the last index.



function binary_var_block_ls(model, blocks)
    block_of_t = Dict{Int, Int}()
    for (b, block) in enumerate(blocks)
        for t in block
            block_of_t[t] = b
        end
    end

    vars_per_block = [VariableRef[] for _ in 1:length(blocks)]

   
    for v in all_variables(model)
        if is_binary(v)
            indices = join_data_from_variable_ls(v)
            
            if !isempty(indices)
                t = indices[end]
                
                if haskey(block_of_t, t)
                    push!(vars_per_block[block_of_t[t]], v)
                end
            end
        end
    end
    return vars_per_block
end



function join_data_from_variable_ls(v::VariableRef)
    m = name(v)
    reg = match(r"\[.*,(\d+)\]", m) 
    if reg !== nothing
        return [parse(Int, reg.captures[1])]
    end
    return []
end
