using Test

function sudoku_valido(sudoku::Matriz{Int})
    
    for linha in linhas(sudoku)
        numeros = Set()
        for num in linha
            if num != 0  # Considera 0 como célula vazia
                if num in numeros || num < 1 || num > 9
                    return false
                end
                push!(numeros, num)
            end
        end
    end

    # Verifica as colunas
    for coluna in 1:size(sudoku)
        numeros = Set()
        for linha in 1:size(sudoku, 1)
            num = sudoku[linha, col]
            if num != 0
                if num in numeros || num < 1 || num > 9
                    return false
                end
                push!(numeros, num)
            end
        end
    end

    return true
end

@testset "Testes de Validação do Sudoku" begin
    # Teste 1: Sudoku válido
    sudoku_valido_1 = [
        5 3 0 0 7 0 0 0 0;
        6 0 0 1 9 5 0 0 0;
        0 9 8 0 0 0 0 6 0;
        8 0 0 0 6 0 0 0 3;
        4 0 0 8 0 3 0 0 1;
        7 0 0 0 2 0 0 0 6;
        0 6 0 0 0 0 2 8 0;
        0 0 0 4 1 9 0 0 5;
        0 0 0 0 8 0 0 7 9
    ]
    @test sudoku_valido(sudoku_valido_1) == true

    # Teste 2: Sudoku válido
    sudoku_valido_2 = [
        1 2 3 4 5 6 7 8 9;
        4 5 6 7 8 9 1 2 3;
        7 8 9 1 2 3 4 5 6;
        2 3 1 5 6 4 8 9 7;
        5 6 4 8 9 7 2 3 1;
        8 9 7 2 3 1 5 6 4;
        3 1 2 6 4 5 9 7 8;
        6 4 5 9 7 8 3 1 2;
        9 7 8 3 1 2 6 4 5
    ]
    @test sudoku_valido(sudoku_valido_2) == true

    # Teste 3: Sudoku não válido
    sudoku_invalido = [
        5 3 0 0 7 0 0 0 0;
        6 0 0 1 9 5 0 0 0;
        0 9 8 0 0 0 0 6 0;
        8 0 0 0 6 0 0 0 3;
        4 0 0 8 0 3 0 0 1;
        7 0 0 0 2 0 0 0 6;
        0 6 0 0 0 0 2 8 0;
        0 0 0 4 1 9 0 0 5;
        1 0 0 0 8 0 0 7 9  # 1 repetido na última linha
    ]
    @test sudoku_valido(sudoku_invalido) == false
end




        
