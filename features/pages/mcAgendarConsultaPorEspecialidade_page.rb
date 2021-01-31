class AgendarConsultaMedicoPage
  include Capybara::DSL #(Domain Specific Language) Descreve ações que serão executadas pelo webdriver específico

  def preencherDadosAgendamento()
    $logger.info("Preenchendo dados do Agendamento")
    sleep 1
    find('div[class*="select-box"]').click
    find('div[class="items-dropdown"]', :text => "Atendimento presencial", visible: false).select_option
  end

  def preencheDadosEspecialidade()
    $logger.info("Preenchendo dados da Especialidade")
    sleep 1
    find('div[class="rededor-checkbox-button-large active"]').click
    sleep 1
    $especialidade = find('input[id*="especialidade"]').set("GASTROENTEROLOGIA CLÍNICA")
    sleep 1
    $especialidade.send_keys(:enter)
    sleep 3
  end

  def preencherLocalAtendimento()
    $logger.info("Preenchendo local de atendimento")
    $localAtend = find('input[class*="aa-input"]').set("SAO PAULO")
    sleep 3
    $localAtend.send_keys(:enter)
  end

  def preencheDataNascimento()
    $logger.info("Preenchendo data de nascimento")
    sleep 1
    find('input[placeholder="DD/MM/AAAA"]').set("15/09/1993")
    find('button[class="rededor-button"]').click
  end

  def preencheFormaPagamento(formaPagamento)
    $logger.info("Escolhendo forma de pagamento")
    sleep 1
    if formaPagamento == "PLANO DE SAÚDE"
      click_button "PLANO DE SAÚDE"
    else
      click_button "PARTICULAR"
    end
  end

  def preencheDadosConvenio
    $logger.info("Preenchendo dados do convênio")
    sleep 1
    $convenio = find('input[id*="convenio"]').set("CENTRAL NACIONAL UNIMED")
    sleep 1
    $convenio.send_keys(:enter)
    sleep 1
    $nomePlano = find('input[id*="plano"]').set("BÁSICA  ENFERMARIA")
    sleep 1
    $nomePlano.send_keys(:enter)
    sleep 1
    find('button[id*="Confirm"]').click
  end

  def escolherMedico()
    $logger.info("Selecionando horário da consulta")
    sleep 1

    if page.has_css?(".hour")
      $medico = first('strong[class="name"]').text()
      first('div[class="hour"]').click
    elsif page.has_css?("div", :text => "Aviso", :visible => true)
      find('button[class="rededor-button"]').click
    else
      puts "Não há horários disponíveis."
    end
    sleep 10
  end

  def clicaConfirmarAgendamento()
    $logger.info("Confirmando Agendamento")
    first('button[class="rededor-button-secondary"]').click
  end

  def preencheDadosPaciente()
    $logger.info("Informando dados do paciente")
    cpf1 = "646.107.649-20"
    cpf2 = "000.514.487-69"
    cpf3 = "188.495.392-15"
    cpf4 = "689.653.202-59"
    cpf5 = "566.445.822-49"
    $dadosNome = Faker::Name.neutral_first_name
    $dadosEmail = "#{Faker::Internet.email}"
    sleep 1
    find('input[formcontrolname="cpf"]').set([cpf1, cpf2, cpf3, cpf4, cpf5].sample)
    sleep 1
    find('input[formcontrolname="nome"]').set(Faker::Name.neutral_first_name)
    sleep 1
    find('input[formcontrolname="nascimento"]').set("15/09/1993")
    sleep 1
    find('div[class*="select-box"]').click
    sleep 1
    find('div[class="items-dropdown"]', :text => "FEMININO", visible: false).select_option
    find('input[formcontrolname="email"]').set($dadosEmail).text
    find('input[formcontrolname="emailConfirmation"]').set($dadosEmail)
    find('input[formcontrolname="telefone"]').set("61999988887")

    find('button[class="rededor-button"]').click

    if page.has_css?("div", :text => "Participe da nossa pesquisa de satisfação", :visible => true)
      find('button[class*="noThanks"]').click
      puts "Agendamento da consulta, com o médico #{$medico}, realizado com sucesso!"
    elsif page.has_css?("div", :text => "Ocorreu um erro com seu agendamento.", :visible => true)
      puts "Ocorreu um erro com seu agendamento."
      # find('button[class="rededor-button"]').click
    end
  end
end
