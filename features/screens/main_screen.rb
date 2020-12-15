# frozen_string_literal: true

class MainScreen < BaseScreen
  def elemento
    {
      id_btn_favorito: "com.ba.universalconverter:id/action_add_favorites",
      id_btn_pesquisa: "com.ba.universalconverter:id/action_search",
      acc_btn_menu: "Gaveta de navegação abrir",
    }
  end

  def clica_botao_pesquisa
    click_id elemento[:id_btn_pesquisa]
  end

  def esperar_botao_pesquisa
    wait_for_id elemento[:id_btn_pesquisa]
  end

  def clica_botao_favorito
    click_id elemento[:id_btn_favorito]
  end

  def esperar_botao_favorito
    wait_for_id elemento[:id_btn_favorito]
  end

  def abrir_menu
    click_accessibility_id elemento[:acc_btn_menu]
  end

  def valida_texto_na_tela(texto)
    wait_for_texts texto
  end

  def clica_no_numero(num)
    find_element(id: "com.ba.universalconverter:id/keypad").find_element(xpath: "//android.widget.Button[@text='#{num}']")
  end

  def seleciona_unidade_lista(unidade)
    move_roolbar(0.5, 0.8, 0.5, 0.2) until wait_for_texts unidade == true
    click_texts unidade
  end
end
