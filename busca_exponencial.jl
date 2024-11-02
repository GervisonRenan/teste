# Função auxiliar: Busca Binária
function busca_binaria(vetor, elemento, esquerda, direita)
    while esquerda <= direita
        meio = div(esquerda + direita, 2)
        if vetor[meio] == elemento
            return meio  # Retorna o índice onde o elemento foi encontrado
        elseif vetor[meio] < elemento
            esquerda = meio + 1
        else
            direita = meio - 1
        end
    end
    return nothing  # Retorna nothing se o elemento não foi encontrado
end

# Função principal: Busca Exponencial
function busca_exponencial(vetor, elemento)
    # Verifica se o primeiro elemento é o desejado
    if vetor[1] == elemento
        return 1  # Retorna o índice 1 (primeira posição)
    end

    # Aumenta o intervalo de pesquisa exponencialmente
    i = 1
    while i < length(vetor) && vetor[i] < elemento
        i *= 2
    end

    # Realiza a busca binária no intervalo encontrado
    return busca_binaria(vetor, elemento, div(i, 2) + 1, min(i, length(vetor)))
end

#########################TESTE UNITÁRIO##########################################################
using Test

vetor = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]  
elemento_presente1 = 7
elemento_presente2 = 11
elemento_presente3 = 1
elemento_presente4 = 19
elemento_nao_presente = 4

 # Testes para a busca exponencial 
 @test busca_exponencial(vetor, elemento_presente1) == 4
 @test busca_exponencial(vetor, elemento_presente2) == 6
 @test busca_exponencial(vetor, elemento_presente3) == 1
 @test busca_exponencial(vetor, elemento_presente4) == 10
 @test busca_exponencial(vetor, elemento_nao_presente) == nothing
