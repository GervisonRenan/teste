include("parte1.jl")
include("parte2.jl")


address = "C:/Users/gervi/OneDrive/Área de Trabalho/progr/1011 (1).txt"
instance = UnPM.open_instance(address)
UnPM.test_file(instance::Main.UnPM.Instanceupm, m::Int, n::Int)
save_solution(Cmax, x, model)