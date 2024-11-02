using JuMP, Cbc

P = ["brinco", "colar", "pulseira"]
M = ["rolo de fio", "pacote de miçanga"]

a= [4.5; 2]
Tmax [2 * 40]
v = [12; 30; 18]
t = [2.5; 5.5; 3.25]
q = [1.2; 3]
u = [0.3  1.2  0.7;
     0.08  0.5  0.3]
d= [3, 4 12]

model = Model (Cbc.Optimizer)

np = length(P)
nm = length(M)

@variable(model, x[1:np] >=0, Int)
@variable(model, xplus [1:np] >=0, int)
@variable(model, y[1:nm] >=0, Int)

@objective(model, Max, sum(x[p] * v[p] + 0.7xplus[p] *v[p] for p= 1:np) - sum(y[m] * a[m] for ))

