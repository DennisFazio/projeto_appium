class MenuScreen < BaseScreen
  def elemento
    {
      txt_menu_minhas_conversoes: "Meus convers",
    }
  end

  def seleciona_minhas_conversoes
    click_texts elemento[:txt_menu_minhas_conversoes]
  end
end
