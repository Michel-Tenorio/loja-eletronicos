Algoritmo "ProdutosEletronicos"

Var
   nomesProdutos : vetor [1..2] de caracter
   precosProdutos : vetor [1..2] de real
   estoqueProdutos : vetor [1..2] de inteiro
   produtosCadastradosOuNao : logico
   opcao, resultado, produtosCadastrados : inteiro

funcao cadastrarProduto (): inteiro
var
   contador, lugaresOcupados : inteiro
   resposta, s : caracter

inicio

   resposta <- "s"
   contador <-1
   enquanto (resposta = "s") e (contador <= 2) faca
      se (nomesProdutos[contador] = "") e (precosProdutos[contador] = 0) e (estoqueProdutos[contador] = 0) entao
         escreval("Informe o nome do produto")
         leia(nomesProdutos[contador])
         escreval ("Informe o preço do produto")
         leia(precosProdutos[contador])
         escreval ("Informe a quantidade em estoque")
         leia(estoqueProdutos[contador])


         escreval ("Produto Cadastrado com sucesso")
         produtosCadastrados <- produtosCadastrados + 1
         produtosCadastradosOuNao <- falso
         escreval (" Quer cadastrar outro produto? S/N")
         leia(resposta)
         se resposta = "s" entao
            contador <- contador + 1
         senao
            escreval ("Cadastro de produtos concluído.")
         fimSe
      senao
         lugaresOcupados <- lugaresOcupados+1
         se lugaresOcupados = 2 entao
            escreval("Não há mais espaços disponíveis")
         fimSe
         contador <- contador + 1


      fimse
   fimEnquanto

   retorne produtosCadastrados
fimFuncao


funcao consultarEstoque(): inteiro
var
   contador  : inteiro
   nome ,x: caracter
inicio
   escreval("Informe o nome do produto que gostaria de consultar")
   leia(nome)
   para contador <- 1 ate 2 faca
      se nome = nomesProdutos[contador] entao
         retorne (estoqueProdutos[contador])
      fimse
   fimPara

fimFuncao

funcao atualizarEstoque(): inteiro
var
   contador, quantidade : inteiro
   resposta, nome : caracter
inicio
   escreval("Informe o nome do produto que gostaria de adicionar ou retirar")
   leia(nome)
   para contador <- 1 ate 2 faca
      se nome = nomesProdutos[contador] entao
         escreval (" Gostaria de retirar ou adiconar? A/R")
         leia(resposta)
         escreval (" Quanto?")
         leia(quantidade)

         se resposta = "a" entao
            estoqueProdutos[contador]<- estoqueProdutos[contador]+quantidade
            escreval(" A quantidade adicionada é :", quantidade)
            escreva (" O novo estoque é :")
            retorne estoqueProdutos[contador]
         senao
            se resposta = "r" entao
               se (estoqueProdutos [contador] > quantidade) entao
                  estoqueProdutos [contador] <- estoqueProdutos[contador]-quantidade
                  escreval(" A quantidade retirada é :", quantidade)
                  escreva (" O novo estoque é:")
                  retorne estoqueProdutos[contador]
               senao
                  se (estoqueProdutos [contador] = quantidade) entao
                     estoqueProdutos[contador]<- estoqueProdutos[contador]-quantidade
                     nomesProdutos[contador]<- ""
                     precosProdutos[contador]<- 0
                     escreval (" O produto foi removido, pois não tem mais estoque")
                     produtosCadastrados<- produtosCadastrados-1
                     retorne  estoqueProdutos[contador]
                  senao
                     escreval ("Tentativa inválida!")
                     escreva("produtos retirados :")
                     retorne 0
                  fimse
               fimse
            fimSE
         fimSe
      fimSe
   fimPara
fimFuncao
funcao listarProduto(): inteiro
var
   contador, produtosCadastrados : inteiro
inicio
   escreval (" Produtos cadastrados :")
   para contador <- 1 ate 2 faca
      se (nomesProdutos[contador]<> "") e (precosProdutos[contador]<> 0) e (estoqueProdutos[contador]<> 0) entao
         escreval ("Nome :", nomesProdutos[contador])
         escreval( "Preço :", precosProdutos[contador])
         escreval ("Estoque :", estoqueProdutos[contador] )
         produtosCadastrados <- produtosCadastrados+1
         escreval()

      fimSe
   fimPara
   escreva ("Produtos listados :")
   retorne produtosCadastrados
fimfuncao


Inicio

   produtosCadastradosOuNao <- verdadeiro
   repita
      escreval()
      escreval("*")
      escreval(" Loja de produtos eletrônicos")
      escreval("*")
      escreval(" Escolha uma opção:")
      escreval (" 1 - Cadastrar produtos ")
      escreval (" 2 - consultarEstoque ")
      escreval (" 3 - Atualizar estoque ")
      escreval (" 4 - Listar Produtos ")
      escreval (" 0 -  Sair ")
      leia(opcao)
      limpaTela
      se opcao = 1 entao
         resultado <- cadastrarProduto()
         escreval("Produtos Cadastrados :", resultado)
      senao
         se opcao = 2 entao
            se produtosCadastradosOuNao entao
               escreva(" Produtos cadastrados :",produtosCadastrados)
               escreval(" Cadastre um produto primeiro")
            senao
               resultado <- consultarEstoque()
               escreval("estoque do produto :",resultado)
            fimSe
         senao
            se opcao = 3 entao
               se produtosCadastradosOuNao entao
                  escreva(" Produtos cadastrados :", produtosCadastrados)
               senao
                  resultado <- atualizarEstoque()
                  escreval(resultado)
               fimse
            senao
               se opcao = 4 entao
                  se produtosCadastradosOuNao entao
                     escreva(" Produtos cadastrados :",  produtosCadastrados)
                  senao
                     escreval(listarProduto)
                  fimSe
               fimSE
            fimSE
         fimSe
      fimSe
   ate (opcao = 0)

Fimalgoritmo