*** Settings ***
Resource  ../main.robot

*** Variables ***
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{opcoesTimes}
...                       //option[contains(.,'Programação')]
...                       //option[contains(.,'Front-End')]
...                       //option[contains(.,'Data Science')]
...                       //option[contains(.,'Devops')] 
...                       //option[contains(.,'UX e Design')]
...                       //option[contains(.,'Mobile')]
...                       //option[contains(.,'Inovação e Gestão')]
${CARD}                   class:colaborador

*** Keywords ***
Dado que eu preencha os campos do formulário corretamente
    ${NOME}=                      FakerLibrary.Name
    ${CARGO}=                     FakerLibrary.Job
    ${IMAGEM}=                    FakerLibrary.Image Url    width=100    height=100
    Input Text                   ${CAMPO_NOME}        ${NOME}            
    Input Text                   ${CAMPO_CARGO}       ${CARGO}        
    Input Text                   ${CAMPO_IMAGEM}      ${IMAGEM}          
    Click Element                ${CAMPO_TIME}
    Click Element                ${opcoesTimes[0]}
E clique no botão de criar card
    Click Element                ${BOTAO_CARD}
Então eu possa identificar o card no time esperado
    Element Should Be Visible    ${CARD}
Então eu posso identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    1    3
        Dado que eu preencha os campos do formulário corretamente
        E clique no botão de criar card        
    END
Então criar e identificar um card em cada time dispnível
    FOR    ${i}    ${TIME}    IN ENUMERATE    @{opcoesTimes}
        Dado que eu preencha os campos do formulário corretamente
        Click Element    ${TIME}
        E clique no botão de criar card
    END
Dado que eu clique no botão de criar card
    Click Element                ${BOTAO_CARD}
Então eu vejo uma mensagem de erro
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro