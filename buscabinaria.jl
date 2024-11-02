##################################################
# b) implementem os algoritmos de busca binária; #
##################################################


function busca_binaria(Array::Vector{X}, target::X) where X
    esquerda, direita = 1, length(Array)
    
    while esquerda <= direita
        meio = div(esquerda + direita, 2)
        if Array[meio] == target
            return meio
        elseif Array[meio] < target
            esquerda = meio + 1
        else
            direita = meio - 1
        end
    end
    
    return nothing # Retorna se o elemento não foi encontrado
end


##############################TESTE UNITÁRIO################################################################
using Test

# Dados de teste
vetor1 = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]  # Vetor ordenado
elemento_presente1 = 7
elemento_presente2 = 11
elemento_presente3 = 1
elemento_presente4 = 19
elemento_nao_presente = 4

 # Testes para a busca binária (vetor precisa estar ordenado)
 @test busca_binaria(vetor1, elemento_presente1) == 4
 @test busca_binaria(vetor1, elemento_presente2) == 6
 @test busca_binaria(vetor1, elemento_presente3) == 1
 @test busca_binaria(vetor1, elemento_presente4) == 10
 @test busca_binaria(vetor1, elemento_nao_presente) == nothing