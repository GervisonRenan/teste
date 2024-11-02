##################################################################################
# 1. Faça um jogo de "Pedra, papel, tesoura" de um usuário contra o computador.  #
#                                                                                #
##################################################################################

#Jogo pedra, papel, tesoura

function determinar_vencedor(jogador, computador)
    if jogador == computador
        return "Empate!"
    elseif (jogador == "Pedra" && computador == "Tesoura") ||
           (jogador == "Papel" && computador == "Pedra") ||
           (jogador == "Tesoura" && computador == "Papel")
        return "Parabéns, você venceu!"
    else
        return "Ops!! Computador venceu!"
    end
end

# Opções para os jogadores
opcoes = ["Pedra", "Papel", "Tesoura"]

# Loop do jogo
while true
    # Jogador
    println("Escolha uma opção: Pedra, Papel ou Tesoura ou digite 'encerrar partida' para terminar:")
    jogador = readline()

   if jogador == "encerrar partida"
        println("Jogo encerrado, até mais!")
        break
    elseif !(jogador in opcoes)
        println("Opção inválida! Tente novamente usando uma das opções válidas.")
        continue
    end

    # Computador
    computador = rand(opcoes)

    # Escolhas
    println("Você escolheu: $jogador")
    println("O computador escolheu: $computador")

    # Resultado 
    resultado = determinar_vencedor(jogador, computador)
    println(resultado)
end
