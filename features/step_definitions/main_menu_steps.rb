Given(/^I land on Home screen$/) do
  main.esperar_botao_pesquisa
  main.esperar_botao_favorito
  ## Teste
  main.clica_no_numero(1)
  binding.pry
end

When(/^I press on Menu icon$/) do
  main.abrir_menu
end

Then(/^I should see left side menu$/) do
  main.valida_texto_na_tela("Conversor de Unidades")
end

When(/^I press on My conversions button$/) do
  menu.seleciona_minhas_conversoes
end

Then(/^I land on My conversions screen$/) do
  main.valida_texto_na_tela("Nenhuma conversão pessoal criado ainda")
end
