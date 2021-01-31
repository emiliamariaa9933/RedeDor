class MenusInicialPage
  include Capybara::DSL #(Domain Specific Language) Descreve ações que serão executadas pelo webdriver específico

  def clicarMenu(menu)
    $logger.info("Acessando menu #{menu}")
    click_link menu

    switch_to_window(windows.last)
  end
end
