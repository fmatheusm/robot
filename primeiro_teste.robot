*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Acessar site organo
    Open Browser    url=http://localhost:3000/    browser=Chrome

Preenchendo formulario
    Input Text    id:form-nome        Matheus
    Input Text    id:form-cargo       Dev
    Input Text    id:form-imagem      https://picsum.photos/200/300
    Click Element    class:lista-suspensa
    Click Element    //option[contains(.,'Programação')]
    Sleep    10s
    Click Button    id:form-botao 
    Element Should Be Visible    class:colaborador
    Sleep    5s