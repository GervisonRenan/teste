# Função para verificar se uma tabela semi preenchida de Sudoku é válida
X = nothing
function tabela_sudoku_valida(tabela::Array{Union{Int, X}, 2})::Bool ######Boll retorna verdadeiro ou falso
    # Verifica linhas
    for linha in tabela
        elementos = filter(!isX, linha)  # Ignora células vazias
        if length(unique(elementos)) != length(elementos)
            return false
        end
    end

    # Verifica colunas
    for i in 1:size(tabela, 2)
        coluna = tabela[:, i]
        elementos = filter(!isX, coluna)  # Ignora células vazias
        if length(unique(elementos)) != length(elementos)
            return false
        end
    end

    return true
end

##############################TESTEUNITÁRIOS##############################################


tabela_valida1 = [

5 X X 1 X X X X X;
X 6 X X 9 5 X X X;
X X 8 X X X X 6 3;
8 X X X 6 X X X 4;
X 9 X 8 X 3 5 X X;
4 X X X 2 X X X 7;
X 5 X X X X 2 7 X;
X X 7 4 1 X X X X;
X X X X X 9 X X 8;
]

tabela_valida2 = [

5 3 X x X X X X X;
X 6 X X 9 5 X X X;
X X 8 X X X X 6 3;
8 X X X 6 X X X 4;
X 9 X 8 X 3 5 X X;
4 X X X 2 X X X 7;
X 5 X X X X 2 7 X;
X X 7 4 1 X X X X;
X X X X X 9 X X 8;
]

tabela_invalida = [
5 X X 5 X X X X X;
X 6 X X 1 5 X X X;
X X 8 X X X X 6 3;
8 X X X 6 X X X 4;
X 9 X 8 X 3 5 X X;
4 X X X 2 X X X 7;
X 5 X X X X 2 7 X;
X X 7 4 1 X X X X;
X X X X X 9 X X 8;
]


using test

@testset "Validação de Sodoku" begin
    @test tabela_sudoku_valida(tabela_valida1) == verdadeiro
    @test tabela_sudoku_valida(tabela_valida2) == verdadeiro
    @test tabela_sudoku_valida(tabela_invalida) == falso

end