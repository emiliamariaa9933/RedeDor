class DadosInvalidosPage
  include Capybara::DSL #(Domain Specific Language) Descreve ações que serão executadas pelo webdriver específico

  def initialize
    $agendar = AgendarConsultaMedicoPage.new
  end

  def verificarDataInvalida()
    $logger.info("Verificando a mensagem de data inválida")
    $agendar.preencherDadosAgendamento
    $agendar.preencheDadosEspecialidade
    $agendar.preencherLocalAtendimento
    sleep 2
    find('input[placeholder="DD/MM/AAAA"]').set("30/02/2021")
    find('button[class="rededor-button"]').click
    sleep 3
  end
end
