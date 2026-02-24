# FUNCTION THAT SPLITS THE TIME HORIZON INTO BLOCKS

function partition_period(period_range, sub_period_length::Int)
    blocks = []
    current_block = Int[]

    for i in period_range
        push!(current_block, i) 

        if length(current_block) == sub_period_length
            push!(blocks, current_block)               
            current_block = Int[]
        end
    end

   
    if !isempty(current_block)
        push!(blocks, current_block)
    end

    return blocks
end


#=
function partition_period(period::Int, sub_period_length::Int)
    blocks = []
    current_block = Int[]

    for i in 1:period
        push!(current_block, i) # add every period to the current block

        if length(current_block) == sub_period_length # if the current block is sub_period_length long, it is added to blocks and I start a new one
            push!(blocks, current_block)               
            current_block = Int[]
        end
    end

    if !isempty(current_block) # if the last block is shorter then sub_period_length, it is added to blocks as it is
        push!(blocks, current_block)
    end

    return blocks
end

=#

