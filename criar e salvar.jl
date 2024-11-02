##########################################################################
#                                                                        #
#     Gere vetores aleatórios e salvem em arquivos separados.            #
#       #writedlm - criar arquivos                                       #
#       #readdlm - ler arquivos criados no writedlm                      #                                        
###########################################################################

using Random ##gerar numeros aleatórios
using DelimitedFiles ##Ler arquivos obs: pesquisar mais sobre 

function gerar_salvar_vet(numero_vetores::Int, tamanho_vetor::Int, caminho::String)

    if !isdir(caminho) ##dir- listar arquivos e diretórios obs: pesquisar mais sobre
       
    end

    for i in 1:numero_vetores
        vetor = rand(1:1000, tamanho_vetor)

        arquivo = joinpath(caminho, "vetor_$i.txt") ##### pesquisar sobre joinpath

        writedlm(arquivo, vetor, ",")  

        println("vetor $i salvo em $arquivo")

    end
end

gerar_salvar_vet( 5, 10, "vetores")
end