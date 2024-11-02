#########################################################
# a) implementem os algoritmos de busca linear;         #
#########################################################


###target = 
###where = 

function busca_linear(Array::Vector{X}, target::X) where X
    for (index, valor) in enumerate(Array)
        if valor == target
            return index ########## Retornar o valor encontrado
        end
    end
    return -1 ######### se não for encontrado 
end 


#################################TESTE UNITÁRIO#################################################
using Test

# Dados de teste
 

vetor1 = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]  # Vetor ordenado
elemento_presente1 = 7
elemento_presente2 = 11
elemento_presente3 = 1
elemento_presente4 = 19
elemento_nao_presente = 4

@testset "Testando algoritmos de busca" begin
    # Testes para a busca linear
    @test busca_linear(vetor1, elemento_presente1) == 4
    @test busca_linear(vetor1, elemento_presente2) == 6
    @test busca_linear(vetor1, elemento_presente3) == 1
    @test busca_linear(vetor1, elemento_presente4) == 10
    @test busca_linear(vetor1, elemento_nao_presente) == nothing
end


