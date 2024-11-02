using JuMP, Clp

P = ["brinco", "colar", "pulseira"]
M = ["rolo de fio", "pacote de miçanga"]

a = [4.5; 2]
Tmax = 40 * 2  ## tempo mx de 40h semanais *2 pq são 2 pessoas
v = [12; 30; 18]
t = [2.5; 5.5; 3.25] ## tempo p produzir cada item
q = [1.2; 3] ## quantidade inicial 
U = [0.3  1.2  0.7
     0.08  0.5 0.3] ## material utilizado

model = Model(Clp.Optimizer)

np = length(P)
nm = length(M)

@variable(model, x[1:np] >=0)
@variable(model, y[1:nm] >=0)

@objective(model, Max, sum(x[p] * v[p] for p =1:np) - sum(y[m] * a[m] for m = 1:nm))

@constraint(model, lim_tempo, sum(x[p] * t[p] for p = 1:np)  <= Tmax)
@constraint(model, lim_material[m = 1:nm], sum(U[m,p] * x[p] for p = 1:np ) <= q[m] + y[m])
 
println(model)
optimize!(model)

 x,y = value.(x), value.(y)
 for p = 1:np println("Produza $(x[p]) $P(p)")
 end
 for m = 1:nm 
   println("Compre $(y[m]) $(M[m])")
 end