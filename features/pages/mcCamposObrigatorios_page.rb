class CamposObrigatoriosPage
  include Capybara::DSL #(Domain Specific Language) Descreve ações que serão executadas pelo webdriver específico

  def initialize
    $agendar = AgendarConsultaMedicoPage.new
  end

  def verificaCamposTipoAtendimento()
    $logger.info("Validando se o botão de consulta permance desabilitado enquando não informa todos os campos obrigatórios.")
    expect(page.has_no_xpath?('//*[@id="aa-input-container"]/rededor-icon')).to eq true
    sleep 1

    $agendar.preencherDadosAgendamento()

    find(:xpath, '//*[@id="aa-input-container"]/rededor-icon').click
    expect(page.has_no_xpath?("/html/body/app-root/div/div[2]/app-local/section/div/div/div/h1")).to eq true
    sleep 1
    $agendar.preencheDadosEspecialidade()
    $agendar.preencherLocalAtendimento()
  end

  def verificaCampoData()
    expect(page.has_selector?(:css, "button[disabled]")).to eq true
    sleep 1
    $agendar.preencheDataNascimento()
  end

  def verificaCamposConvenio()
    $agendar.preencheFormaPagamento("PLANO DE SAÚDE")
    expect(page.has_selector?(:css, "button[disabled]")).to eq true
    sleep 1
    $agendar.preencheDadosConvenio()
    $agendar.escolherMedico()
    $agendar.clicaConfirmarAgendamento
  end

  def verificaCamposDadosPaciente()
    sleep 1
    expect(page.has_selector?(:css, "button[disabled]")).to eq true
  end
end
