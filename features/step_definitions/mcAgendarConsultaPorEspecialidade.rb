Dado("que eu estou na aplicação Rede D`or na funcionalidade de Marcar Consulta") do
  visit "/"
  MenusInicialPage.new.clicarMenu("Marque uma consulta")
end

Quando("eu preencho os dados referente ao Agendamento de Consultas") do
  AgendarConsultaMedicoPage.new.preencherDadosAgendamento()
end

Quando("preencho os dados referente ao Médico") do
  AgendarConsultaMedicoPage.new.preencheDadosEspecialidade()
end

Quando("preencho os dados referente ao Local") do
  AgendarConsultaMedicoPage.new.preencherLocalAtendimento()
end

Quando("preencho os dados referente ao Paciente") do
  AgendarConsultaMedicoPage.new.preencheDataNascimento()
end

Quando('preencho os dados referente ao Convênio\/Plano') do
  AgendarConsultaMedicoPage.new.preencheFormaPagamento("PLANO DE SAÚDE")
  AgendarConsultaMedicoPage.new.preencheDadosConvenio()
  AgendarConsultaMedicoPage.new.escolherMedico()
  AgendarConsultaMedicoPage.new.clicaConfirmarAgendamento()
end

Quando("Informo os dados do paciente para concluir o agendamento e aciono o botão para confirmar os dados") do
  AgendarConsultaMedicoPage.new.preencheDadosPaciente()
end

Então("o sistema apresenta a tela com as informações do agendamento da consulta") do
  page.should have_content("Tudo Pronto!")
  page.should have_content($medico)
end
