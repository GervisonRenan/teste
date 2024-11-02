# Função para determinar o vencedor
function determinar_vencedor(jogador, computador)
    if jogador == computador
        return "Empate!"
    elseif (jogador == "Pedra" && computador == "Tesoura") ||
           (jogador == "Papel" && computador == "Pedra") ||
           (jogador == "Tesoura" && computador == "Papel")
        return "Você venceu!"
    else
        return "Computador venceu!"
    end
end

# Opções possíveis
opcoes = ["Pedra", "Papel", "Tesoura"]

# Loop do jogo
while true
    # Escolha do jogador
    println("Escolha uma opção: Pedra, Papel ou Tesoura (ou digite 'sair' para terminar):")
    jogador = readline()

    # Verifica se o jogador quer sair
    if jogador == "sair"
        println("Jogo encerrado.")
        break
    elseif !(jogador in opcoes)
        println("Opção inválida! Tente novamente.")
        continue
    end

    # Escolha aleatória do computador
    computador = rand(opcoes)

    # Exibir escolhas
    println("Você escolheu: $jogador")
    println("O computador escolheu: $computador")

    # Determinar e exibir o vencedor
    resultado = determinar_vencedor(jogador, computador)
    println(resultado)
end


