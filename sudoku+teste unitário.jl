############################################################################################################################################################################################################################################################
#  3. (Do LeetCode) Crie uma função para determinar se uma tabela semi preenchida de um sudoku é válida (retornar "true" se for válida, e "false" caso contrário). Apenas as células preenchidas devem ser validadas a partir das seguintes regras:        #
# - Cada coluna precisa conter os dígitos 1-9 sem repetição.                                                                                                                                                                                               #
#- Cada linha precisa conter os dígitos 1-9 sem repetição.
#Para saber se a função está funcionando, crie 3 exemplos, 2 válidos e 1 não válido, e verifique. Leiam sobre testes unitários para a implementação.                                                                                                       #
#
#    board= criar matriz (sudoku)
#    Union= unir dois conjuntos, identificar elementos repetitivos 
#    nothing= significa nulo, usado para as casas vazias 
#     Bool= verdadeiro ou falso 
###############################################################################################################################################################################################################################################################  

function sudoku_valido(board::Array{Union{Int, Nothing}, 2})::Bool ### foi pesquisado
  

    function num_repetidos(numeros)
        filtrar_numeros = filtrar(!isnothing, numeros)
        return length(filtrar_numeros) != length(unique(filtrar_numeros))  ##
    end
    
    # Verificar linhas
    for linha in 1:size(board, 2)
        linha = board[:, linha]
        if num_repetidos(linha)
            return false
        end
    end

    # Verificar colunas
    for coluna in 1:size(board, 2)
        coluna = board[:, coluna]
        if num_repetidos(coluna)
            return false
        end
    end

    # Verificar subquadrados 3x3
    for i in 1:3:size(board, 1)
        for j in 1:3:size(board, 2)
            subgrid = [board[i + x, j + y] for x in 0:2, y in 0:2]
            if has_duplicates(subgrid)
                return false
            end
        end
    end
    
    return true
end

########################################## TESTE UNITÁRIO ###############################################################
using Test

@testset "Sudoku valido" begin
    board_valido = [
        5 nothing nothing nothing 7 nothing nothing nothing nothing;
        6 nothing nothing 1 9 5 nothing nothing nothing;
        nothing 9 8 nothing nothing nothing nothing 6 nothing;
        8 nothing nothing nothing 6 nothing nothing nothing 3;
        4 nothing nothing 8 nothing 3 nothing nothing 1;
        7 nothing nothing nothing 2 nothing nothing nothing 6;
        nothing 6 nothing nothing nothing nothing 2 8 nothing;
        nothing nothing nothing 4 1 9 nothing nothing 5;
        nothing nothing nothing nothing 8 nothing nothing 7 9
    ]
    @test sudoku_valido(board_valido) == true

    
    board_invalido_linha = [
        5 3 nothing nothing 7 nothing nothing nothing nothing;
        6 nothing nothing 1 9 5 nothing nothing nothing;
        nothing 9 8 nothing nothing nothing nothing 6 nothing;
        8 nothing nothing nothing 6 nothing nothing nothing 3;
        4 nothing nothing 8 nothing 3 nothing nothing 1;
        7 nothing nothing nothing 2 nothing nothing nothing 6;
        nothing 6 nothing nothing nothing nothing 2 8 nothing;
        nothing nothing nothing 4 1 9 nothing nothing 5;
        5 nothing nothing nothing 8 nothing nothing 7 9
    ]
    @test sudoku_valido(board_invalido_linha) == false

    
    board_invalido_coluna = [
        5 nothing nothing nothing 7 nothing nothing nothing nothing;
        6 nothing nothing 1 9 5 nothing nothing nothing;
        5 9 8 nothing nothing nothing nothing 6 nothing;
        8 nothing nothing nothing 6 nothing nothing nothing 3;
        4 nothing nothing 8 nothing 3 nothing nothing 1;
        7 nothing nothing nothing 2 nothing nothing nothing 6;
        nothing 6 nothing nothing nothing nothing 2 8 nothing;
        nothing nothing nothing 4 1 9 nothing nothing 5;
        nothing nothing nothing nothing 8 nothing nothing 7 9
    ]
    @test sudoku_valido(board_invalido_coluna) == false

    
end