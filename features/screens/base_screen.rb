# frozen_string_literal: true

class BaseScreen

  #Método para esperar um elemento mapeado estar visível na tela por xpath durante 10s.
  def wait_for_xpath(xpath, timeout = 10)
    @driver.wait_true(timeout) do
      @driver.exists { @driver.find_element(:xpath, xpath) }
    end
  end

  #Método para esperar um elemento mapeado estar visível na tela por id durante 10s.
  def wait_for_id(id, timeout = 10)
    @driver.wait_true(timeout) do
      @driver.exists { @driver.find_element(:id, id) }
    end
  end

  #Método para esperar um elemento mapeado estar visível na tela por accessibility_id durante 10s.
  def wait_for_accessibility_id(seletor, timeout = 10)
    @driver.wait_true(timeout) do
      @driver.exists { @driver.find_element(:accessibility_id, seletor) }
    end
  end

  #Método para esperar N elementos na tela mapeados por texto_id durante 10s.
  def wait_for_texts(text, timeout = 10, pos = 0)
    retorno = false
    @driver.wait_true(timeout) do
      @driver.exists {
        @driver.texts(text)[pos]
        retorno = true
      }
    end
    retorno
  end

  #Método para clicar um elemento mapeado na tela por id.
  def click_id(id)
    @driver.find_element(:id, id).click
  end

  #Método para clicar um elemento mapeado na tela por xpath.
  def click_xpath(xpath)
    @driver.find_element(:xpath, xpath).click
  end

  #Método para clicar em N elementos mapeado na tela por texto.
  def click_texts(text, pos = 0)
    @driver.texts(text)[pos].click
  end

  #Método para clicar em um ponto específico da tela
  def click_for_coordination(loc_x, loc_y, num_clicks)
    Appium::TouchAction.new.tap(x: loc_x, y: loc_y, count: num_clicks).perform
  end

  #Método para clicar um elemento mapeado na tela por accessibility_id.
  def click_accessibility_id(seletor)
    @driver.find_element(:accessibility_id, seletor).click
  end

  #Método para preencher um campo mapeado na tela por id.
  def send_keys_id(id, field)
    @driver.find_element(:id, id).send_keys(field)
  end

  #Método para preencher um campo mapeado na tela por xpath.
  def send_keys_xpath(xpath, field)
    @driver.find_element(:xpath, xpath).send_keys(field)
  end

  #Método para preencher um campo mapeado na tela por accessibility_id.
  def send_keys_accessibility_id(seletor, field)
    @driver.find_element(:accessibility_id, seletor).send_keys(field)
  end

  #Método para pegar o texto dos elementos por ID.
  def text_element_id(id)
    texto = @driver.find_element(:id, id).text
    texto
  end

  #Método para pegar o texto dos elementos por xpath.
  def text_element_xpath(xpath)
    texto = @driver.find_element(:xpath, xpath).text
    texto
  end

  #Método para mover a barra de rolagem
  def move_roolbar(sx = 0.5, sy = 0.2, ex = 0.5, ey = 0.8, duration = 600)
    Appium::TouchAction.new.swipe(start_x: sx, start_y: sy, end_x: ex, end_y: ey, duration: duration).perform
  end

  def encontre_na_lista(texto)
    3.time { move_roolbar }

    tela_atual = get_source
    proxima_tela = ""

    until wait_for_texts(texto) || tela_atual == proxima_tela
      move_roolbar
      proxima_tela = tela_atual
      tela_atual = get_source
    end

    if wait_for_texts(texto)
      click_texts(texto)
    else
      raise("Não achei o elemento com o texto #{texto}")
    end
  end
end
