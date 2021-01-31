Quando("eu não informo nenhum campo") do
  CamposObrigatoriosPage.new.verificaCamposTipoAtendimento()
  CamposObrigatoriosPage.new.verificaCampoData()
end

Quando("aciono o botão de ação") do
  CamposObrigatoriosPage.new.verificaCamposConvenio()
  CamposObrigatoriosPage.new.verificaCamposDadosPaciente()
end

Então("o sistema não deve realizar nenhuma ação") do
end
