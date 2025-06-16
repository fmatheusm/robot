*** Settings ***
Resource         ../resources/main.robot 
Test Setup       Dado que acesso o Orano
Test Teardown    Fechar o navegador

*** Test Cases ***
Validar campo obrigatorio do formulario
    Quando clico no botao criar card
    Entao a mensagem de campo obrigatorio deve ser exibida