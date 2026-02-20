# NEW


function binary_var_block(model, blocks)
    # 1. Mappa dei tempi ai blocchi (rimane uguale)
    block_of_t = Dict{Int, Int}()
    for (b, block) in enumerate(blocks)
        for t in block
            block_of_t[t] = b
        end
    end

    vars_per_block = [VariableRef[] for _ in 1:length(blocks)]

    # 2. Cicla sulle variabili binarie
    for v in all_variables(model)
        if is_binary(v)
            # Recuperiamo gli indici direttamente dall'oggetto variabile
            # Senza usare name(v) o Regex!
            indices = join_data_from_variable(v) # Metodo helper sotto
            
            if !isempty(indices)
                t = indices[end] # L'ultimo indice è il tempo (Int)
                
                if haskey(block_of_t, t)
                    push!(vars_per_block[block_of_t[t]], v)
                end
            end
        end
    end
    return vars_per_block
end

# Funzione helper per estrarre gli indici senza parsing di stringhe
function join_data_from_variable(v::VariableRef)
    # Questa è la via corretta in JuMP per accedere ai metadati
    # Se la variabile è x[prod, t], ritorna ("prod", t)
    m = name(v)
    # Se proprio dobbiamo usare il nome, puliamo solo l'ultimo pezzo
    # ma in modo che accetti sia stringhe che numeri
    reg = match(r"\[.*,(\d+)\]", m) 
    if reg !== nothing
        return [parse(Int, reg.captures[1])]
    end
    return []
end