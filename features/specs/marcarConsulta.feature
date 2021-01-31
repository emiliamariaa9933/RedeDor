#language:pt

@marcarConsulta
Funcionalidade: Marcar Consulta
    Para que eu possa gerir a funcionalidade de Marcar Consulta
    Sendo um usuario acessando a aplicação Rede D'or
    Posso gerir as funcionalidades

Contexto: Acessar Marcar Consulta
    Dado que eu estou na aplicação Rede D`or na funcionalidade de Marcar Consulta


@mcEspecialidade
Cenario: Agendar Consulta

    Quando eu preencho os dados referente ao Agendamento de Consultas
    E preencho os dados referente ao Médico
    E preencho os dados referente ao Local
    E preencho os dados referente ao Paciente
    E preencho os dados referente ao Convênio/Plano
    E Informo os dados do paciente para concluir o agendamento e aciono o botão para confirmar os dados
    Então o sistema apresenta a tela com as informações do agendamento da consulta


@mcCamposObrigatorios
Cenario: Campos obrigatórios não preenchidos

    Quando eu não informo nenhum campo
    E aciono o botão de ação
    Então o sistema não deve realizar nenhuma ação


@mcDadosInvalidos
Cenario: Preencher data de nascimento inválida

    Quando eu informo a data de nascimento com dados inválidos
    E aciono o botão prosseguir
    Então o sistema deve apresentar a mensagem "Data de nascimento inválida"

