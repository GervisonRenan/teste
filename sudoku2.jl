function is_valid_sudoku(board::Vector{Vector{Int}})
    # Função para verificar a validade das linhas e colunas
    function is_valid_unit(unit::Vector{Int})
        seen = Set{Int}()
        for num in unit
            if num != 0  # Ignora células vazias (representadas por 0)
                if num in seen || num < 1 || num > 9
                    return false
                end
                push!(seen, num)
            end
        end
        return true
    end

    # Verifica as linhas
    for row in board
        if !is_valid_unit(row)
            return false
        end
    end

    # Verifica as colunas
    for col in 1:9
        column = [board[row][col] for row in 1:9]
        if !is_valid_unit(column)
            return false
        end
    end

    return true
end

# Exemplos para testar a função
board_valid1 = [
    [5, 3, 0, 0, 7, 0, 0, 0, 0],
    [6, 0, 0, 1, 9, 5, 0, 0, 0],
    [0, 9, 8, 0, 0, 0, 0, 6, 0],
    [8, 0, 0, 0, 6, 0, 0, 0, 3],
    [4, 0, 0, 8, 0, 3, 0, 0, 1],
    [7, 0, 0, 0, 2, 0, 0, 0, 6],
    [0, 6, 0, 0, 0, 0, 2, 8, 0],
    [0, 0, 0, 4, 1, 9, 0, 0, 5],
    [0, 0, 0, 0, 8, 0, 0, 7, 9]
]

board_valid2 = [
    [5, 3, 4, 6, 7, 8, 9, 1, 2],
    [6, 7, 2, 1, 9, 5, 3, 4, 8],
    [1, 9, 8, 3, 4, 2, 5, 6, 7],
    [8, 5, 9, 7, 6, 1, 4, 2, 3],
    [4, 2, 6, 8, 5, 3, 7, 9, 1],
    [7, 1, 3, 9, 2, 4, 8, 5, 6],
    [9, 6, 1, 5, 3, 7, 2, 8, 4],
    [2, 8, 7, 4, 1, 9, 6, 3, 5],
    [3, 4, 5, 2, 8, 6, 1, 7, 9]
]

board_invalid = [
    [5, 3, 4, 6, 7, 8, 9, 1, 2],
    [6, 7, 2, 1, 9, 5, 3, 4, 8],
    [1, 9, 8, 3, 4, 2, 5, 6, 7],
    [8, 5, 9, 7, 6, 1, 4, 2, 3],
    [4, 2, 6, 8, 5, 3, 7, 9, 1],
    [7, 1, 3, 9, 2, 4, 8, 5, 6],
    [9, 6, 1, 5, 3, 7, 2, 8, 4],
    [2, 8, 7, 4, 1, 9, 6, 3, 5],
    [3, 4, 5, 2, 8, 6, 1, 7, 9]  # Linha 9, coluna 1 e 9 repetidos (2)
]

# Testes unitários
@assert is_valid_sudoku(board_valid1) == true
@assert is_valid_sudoku(board_valid2) == true
@assert is_valid_sudoku(board_invalid) == false

println("Todos os testes passaram!")
