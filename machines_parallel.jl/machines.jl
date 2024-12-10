include("machines_paralle.jl")

address = "C:/Users/gervi/OneDrive/Área de Trabalho/progr/1011 (1).txt"

instance = UnPM.open_instance(address)

UnPM.test_file(instance, 10, 100)
Cmax, x, model = un_parallel_machine(instance)
save_solution(Cmax, x, model)
end