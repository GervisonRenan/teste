
module UnPM  ## 
    struct Instanceupm
        p::Array{Int, 2}
        m::Int
        n::Int
    end

    function open_instance(address::String)
        lines = readlines(address)  ##ler linha por linha
        n, m, _ = parse.(Int, split(lines[1])) ##parse transformar um string em um dado, pesquisar mais 
        p = zeros(Int, m, n) ##
        for j in 1:n
            line_idx = j + 2 ## pular as 2 linhas iniciais 
            line = split(lines[line_idx])
            for i in 1:m
                col_idx = i * 2
                p[i, j] = parse(Int, line[col_idx])
            end
        end
        return Instanceupm(p, m, n)
    end

    function test_file(instance)  #### dificuldades em fazer testes unitários 
        @assert size(instance.p) == (instance.m, instance.n) "tamanho de array inválido"
        @assert instance.m == instance.m "número de máquinas não corresponde"
        @assert instance.n == instance.n "número de tarefas não corresponde"
    end
end

using JuMP, HiGHS, .UnPM ## HiGHS serve para resolver PL, PI, PIM

function un_parallel_machine(instance)
   
    model = Model(HiGHS.Optimizer)
   
    @variable(model, x[1:instance.m, 1:instance.n], Bin)
    @variable(model, Cmax ≥ 0)
   
    @objective(model, Min, Cmax)
   
    for j in 1:instance.n
        @constraint(model, sum(x[i, j] for i in 1:instance.m) == 1)
    end
    
    for i in 1:instance.m
        @constraint(model, sum(instance.p[i,j]*x[i, j] for j in 1:instance.n) ≤ Cmax)
    end
    
    optimize!(model)
    return value(Cmax), value.(x), model
end

function save_solution(Cmax, x, model, instance)
    if JuMP.termination_status(model) == MOI.OPTIMAL
        open("machines_parallel.txt", "w") do file
            write(file, "Makespan mínimo: $Cmax\n")
            for i in 1:instance.m
                for j in 1:instance.n
                    if x[i, j] > 0.5
                        write(file, "$j, $i\n")
                    end
                end
            end
        end
    else
        println("A solução ótima não pode ser encontrada")
        open("machines_parallel", "w") do file
            write(file, "Makespan mínimo: $Cmax\n")
        end
    end
end

address = "C:/Users/gervi/OneDrive/Área de Trabalho/progr/1011 (1).txt"
instance = UnPM.open_instance(address)
UnPM.test_file(instance)
Cmax, x, model = un_parallel_machine(instance)
save_solution(Cmax, x, model, instance)
