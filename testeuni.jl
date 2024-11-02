using Test

# Função que queremos testar
function soma(a, b)
    return a + b
end

# Testes unitários
@testset "Testes da função soma" begin
    @test soma(1, 2) == 3         # Testa se 1 + 2 é igual a 3
    @test soma(0, 0) == 0         # Testa se 0 + 0 é igual a 0
    @test soma(-1, 1) == 0        # Testa se -1 + 1 é igual a 0
    @test soma(5, 5) == 10        # Testa se 5 + 5 é igual a 10
