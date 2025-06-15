*** Settings ***
Library          SeleniumLibrary
Resource         setup_teardown.robot
Test Setup       Dado que acesso o Orano
Test Teardown    Fechar o navegador

*** Variables ***
${BOTAO_CARD}              id:form-botao
${ERRO_MESSAGE}            css:p[id$="erro"]

*** Test Cases ***
Validar campo obrigatorio do formulario
    Quando clico no botao criar card
    Entao a mensagem de campo obrigatorio deve ser exibida

*** Keywords ***
Quando clico no botao criar card
    Click Button    ${BOTAO_CARD}

Entao a mensagem de campo obrigatorio deve ser exibida
    Element Should Be Visible    ${ERRO_MESSAGE}