*** Settings ***
Resource         ../resources/main.robot 
Test Setup       Dado que acesso o Orano
Test Teardown    Fechar o navegador

*** Test Cases ***
Criar card com sucesso
    Dado que preencho os campos do formulario
    Quando clico no botao criar card
    Entao identifico o card no time esperado

Validar criacao de um time
    Então devo identificar 3 cards no time esperado

Validar criacao de cada time
    Dado que preencho os campos do formulario
    Entao deve ser exibido um card em cada time disponivel
    