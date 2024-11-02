using JuMP, Clp

model = Model(Clp.Optimizer)

@variable(model, x1 >= 0)
@variable(model, x2 >= 0)

@objective(model, Max, x1+2x2)

@constraint(model, x1 + 3x2 <=6)
@constraint(model, 7x1 + 5x2 <=12)

println(model)
terminal_status = optimize!(model)

value(x1), value(x2)
