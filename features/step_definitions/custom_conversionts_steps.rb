# frozen_string_literal: true

Dado("que estou da tela de Minhas Conversões") do
  main.abrir_menu
  menu.seleciona_minhas_conversoes
end

Quando("crio uma nova conversão com o nome {string}") do |name_conversion|
  myconversions.clica_criar_primeira_conversao
  myconversions.informa_nome_nova_conversao(name_conversion)
end

Quando("informo as seguintes unidades") do |table|
  unidades = table.rows_hash
  unidades.each do |unidade|
    binding.pry
    myconversions.incluir_nova_unidade(unidade[:Nome_Unidade], unidade[:simbolo], unidade[:valor])
  end
end

Então("devo visualizar a conversão {string} na tela de minhas conversões") do |name_conversion|
  main.valida_texto_na_tela(name_conversion)
  myconversions.valida_nome_da_conversao(name_conversion)
end
