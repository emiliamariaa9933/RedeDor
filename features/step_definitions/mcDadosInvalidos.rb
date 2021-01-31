Quando("eu informo a data de nascimento com dados inválidos") do
  DadosInvalidosPage.new.verificarDataInvalida
end

Quando("aciono o botão prosseguir") do
end

Então("o sistema deve apresentar a mensagem {string}") do |msg_erro|
  page.should have_content(msg_erro)
end
