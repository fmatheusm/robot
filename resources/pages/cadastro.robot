*** Settings ***
Resource    ../main.robot

*** Variables ***
${CAMPO_NOME}              id:form-nome
${CAMPO_CARGO}             id:form-cargo
${CAMPO_IMG}               id:form-imagem
${CAMPO_TIME}              class:lista-suspensa
${BOTAO_CARD}              id:form-botao
${CARD_COLABORADOR}        class:colaborador
${ERRO_MESSAGE}            css:p[id$="erro"]

@{select_times}
...       //option[contains(.,'Programação')]
...       //option[contains(.,'Front-End')]
...       //option[contains(.,'Data Science')]
...       //option[contains(.,'Devops')] 
...       //option[contains(.,'UX e Design')]
...       //option[contains(.,'Mobile')]
...       //option[contains(.,'Inovação e Gestão')]

@{equipes}
...    Programação
...    Front-End
...    Data Science
...    Devops
...    UX e Design
...    Mobile
...    Inovação e Gestão

*** Keywords ***
Dado que preencho os campos do formulario
    ${Nome}          FakerLibrary.First Name
    Input Text       ${CAMPO_NOME}    ${Nome}  
    ${Cargo}         FakerLibrary.Job 
    Input Text       ${CAMPO_CARGO}    ${Cargo}
    ${img}           FakerLibrary.Image Url    width=100    height=100
    Input Text       ${CAMPO_IMG}      ${img}
    Click Element    ${CAMPO_TIME}    
    Click Element    ${select_times}[0]
Quando clico no botao criar card
    Click Button    ${BOTAO_CARD}         
Entao identifico o card no time esperado
    Element Should Be Visible    ${CARD_COLABORADOR}
Então devo identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    0    3
        Dado que preencho os campos do formulario
        Quando clico no botao criar card
    END
    @{Colaboradores}    Get WebElements    //section[.//h3[text()='Programação']]//div[@class='colaborador']
    Length Should Be    ${Colaboradores}    3
Entao deve ser exibido um card em cada time disponivel
    FOR    ${index}    ${time}    IN ENUMERATE    @{select_times}
        Dado que preencho os campos do formulario
        Click Element    ${time}
        Quando clico no botao criar card
        ${equipe_atual}    Set Variable    ${equipes}[${index}]
        ${equipes_section}    Get WebElement    //section[.//h3[text()='${equipe_atual}']]//div[@class='colaborador']
        Element Should Be Visible    ${equipes_section}
    END

Entao a mensagem de campo obrigatorio deve ser exibida
    Element Should Be Visible    ${ERRO_MESSAGE}