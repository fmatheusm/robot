*** Settings ***
Resource    ../main.robot

*** Keywords ***
Dado que acesso o Orano
    Open Browser    url=http://localhost:3000/   browser=Chrome

Fechar o navegador
    Close Browser