##########################################################################################################
#                                                                                                        #
#  Faça o exercício da torre de Hanoi do livro de C++ (ou qualquer outro do mesmo naipe de dificuldade). #
###########################################################################################################

function torre_hanoi(i, origem, destino, aux)

    if i == 1
        println("Mover disco 1 de $origem para o $destino")

    else 
        torre_hanoi(i - 1, origem, aux, destino)

        println("Mover disco $i de $origem para o $destino")

        torre_hanoi(i-1, aux, destino, origem)

    end
end

torre_hanoi(3, "A", "C", "B")
