*** Settings ***
Resource          ../resources/main.robot
Test Setup        Dado que eu acesso o Organo
Test Teardown     Fechar o navegador

*** Variables ***
${BOTAO_CARD}             id:form-botao

*** Test Cases ***
Verificar se ao preencher os campos obrigatórios incorretamente o sistema exibe uma mensagem de erro
    Dado que eu clique no botão de criar card
    Então eu vejo uma mensagem de erro
