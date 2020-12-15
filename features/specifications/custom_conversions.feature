            # frozen_string_literal: true

            #language: pt
Funcionalidade: Criar e gerenciar novas unidades de conversões
    Eu como usuário quero cadastrar novas unidades de conversões
            Para que eu possa utiliza-las ou gerencia-las

  @fazendo
  Cenario: Criar minha primeira Unidadeds
    Dado que estou da tela de Minhas Conversões
    Quando crio uma nova conversão com o nome 'Power'
    E informo as seguintes unidades
      | Nome_Unidade | simbolo | valor |
      | Horse power  | HP      | 1     |
      | Mule power   | MP      | 0.5   |
    Então devo visualizar a conversão 'Power' na tela de minhas conversões




