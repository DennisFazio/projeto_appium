# frozen_string_literal: true

class MyConversionsScreen < BaseScreen
  def elemento
    {
      id_link_criar_primeira_conversao: "com.ba.universalconverter:id/btn_new_custom_conversion",
      id_btn_nova_unidade: "com.ba.universalconverter:id/btn_new_custom_unit",
      id_input_nome_conversao: "com.ba.universalconverter:id/edit_custom_conversion_category_name",
      id_input_nome_unidade: "com.ba.universalconverter:id/edit_custom_conversion_unit_dtls_name",
      id_input_simbolo: "com.ba.universalconverter:id/edit_custom_conversion_unit_dtls_symbol",
      id_input_valor: "com.ba.universalconverter:id/edit_custom_conversion_unit_dtls_value",
      id_btn_ok_unidade: "	com.ba.universalconverter:id/btn_unit_dtls_ok",
      id_btn_ok_conversao: "com.ba.universalconverter:id/btn_custom_conversion_details_ok",
    }
  end

  def clica_criar_primeira_conversao
    click_id elemento[:id_link_criar_primeira_conversao]
  end

  def informa_nome_nova_conversao(name)
    wait_for_id elemento[:id_input_nome_conversao]
    send_keys_id elemento[:id_input_nome_conversao], name
  end

  def incluir_nova_unidade(nome_unidade, simbolo, valor)
    click_id elemento[:id_btn_nova_unidade]
    send_keys_id elemento[:id_input_nome_unidade], nome_unidade
    send_keys_id elemento[:id_input_simbolo], simbolo
    send_keys_id elemento[:id_btn_valor], valor
    click_id elemento[:id_btn_ok_unidade]
  end

  def confirma_inclusao_conversao
    click_id elemento[:id_btn_ok_conversao]
  end

  def valida_nome_da_conversao(nome_espererado)
    nome = text_element_id elemento[:id_nome_conversão]
    fail("Nome encontrado: #{nome} é diferente do nome esperado: #{nome_espererado}") if nome != nome_espererado
  end
end
