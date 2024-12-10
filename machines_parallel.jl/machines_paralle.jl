module UnPM

struct Instanceupm
    p::Array{Int, 2}
    m::Int            
    n::Int           
end

function open_instance(address::String)
    lines = readlines(address)

    n, m, _ = parse.(Int, split(lines[1]))

    p = zeros(Int, m, n)

    for j in 1:n
        line_idx = j + 2
        line = split(lines[line_idx])
        for i in 1:m
            column_idx = i * 2
            p[i, j] = parse(Int, line[column_idx])
        end
    end
    return Instanceupm(p, m, n)
end
end
using JuMP, HiGHS

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

    return Cmax, x, model
end

