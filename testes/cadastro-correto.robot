*** Settings ***
Resource          ../resources/main.robot
Test Setup        Dado que eu acesso o Organo
Test Teardown     Fechar o navegador

*** Test Cases ***
Verificar se ao preencher o formulário corretamente, os dados são inseridos no card e se o card está visível
    Dado que eu preencha os campos do formulário corretamente
    E clique no botão de criar card
    Então eu possa identificar o card no time esperado

Verificar se é possível criar mais de um card
    Dado que eu preencha os campos do formulário corretamente
    E clique no botão de criar card
    Então eu posso identificar 3 cards no time esperado

Verificar se é possível criar um card para cada time da empresa
    Dado que eu preencha os campos do formulário corretamente
    Então criar e identificar um card em cada time dispnível