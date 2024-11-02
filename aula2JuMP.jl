using JuMP, Clp

P = ["Brinco", "Colar", "Pulseira"]
M = ["Rolo de fio", "Pacote de miçanga"]

a = [4.5; 2]
Tmax = 2 * 40
v = [12; 30; 18]
T = [2.5; 5.5; 3.25  ]
Q = [1; 2; 3]
U = [0.3 1.2  2.0;
     0.08 0.5 0.3]

     model = Model(Clp.Optimizer)
     
     np = length(P)
     nm = length(M)
   
     @variable(model, x[1:np])
     @variable(model, y[1:nm])

     @objective(model, Max, sum(x[p] * v[p] for p= 1:np) - sum(y[m] * a[m] for m = 1:nm))

     @constraint(model, lim_material sum(x [p] * T[p] for p = 1:np) <= Tmax)
     @constraint(model, lim_material[m = 1:nm], sum(U[m,p] *x[p] for p = 1:np) <= Q[m] + y[m])
     

println(model)
optimize!(model)
