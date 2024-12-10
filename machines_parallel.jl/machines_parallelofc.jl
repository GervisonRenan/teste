using JuMP, HiGHS;

function machines_parallel(n, m, P)

    model = Model(HiGHS.Optimizer)

    @variable(model, Cmax >= 0)
    @variable(model, X[1:n, 1:m], Bin)

    @objective(model, Min, Cmax)

    for i in 1:n
        @constraint(model, sum(X[i, j] for j in 1:m) == 1)
    end

    for j in 1:n
        @constraint(model, sum(X[i, j] for j in 1:m) == 1)
    end

    optimize!(model)

    if termination_status(model) == MOI.OPTIMAL
return value(Cmax), [round(Int, Value(x[i,j] )) for i in 1:n, j in 1:m]

    else
        return nothing, nothing
    end
end

module UnPM

struct Instanceupm

    p::Array{Int, 2}
    m::Int
    n::Int

end

function open_instance(address::String)
    lines = readlines(address)

    n, m, _ = parse.(Int, m, n)

    p = zeros(Int, m, n)

    for j in 1:n
        line_idx = j + 2
        line = split(lines[line_idx])
        for i in 1:m
            coln_idx = 1 * 2
            p[i, j] = parse(Int, line[coln_idx])

        end
    end 
    return Instanceupm(p, m, n)

end 
end

address = "C:/Users/gervi/Downloads/1011 (1).txt"
instance = UnPM.open_instance(address)

UnPM.test_file(instance, 10, 100)
Cmax, x, model = machines_parallelofc(instance)
save_solution(Cmax, x, model)