*** Settings ***
Documentation       Login
...                 Para que eu posssa ter acesso a area de anuncios
...                 Sendo um usuario que possuo um email
...                 Quero poder iniciar uma sessao

Resource            ../resources/steps_kw.robot

Suite Setup          Start Session
Suite Teardown       End Session

Test Teardown       End Test

*** Test Cases ***

Login user
    Dado que acesso a pagina de login
    Quando submeto com o login "telverneck@hotmail.com"
    Entao devo ver a area logada
  
Login invalid user
    [Template]      Tentar logar
    telvern         Oops. Informe um email válido!

Special character email
    [Template]                  Tentar logar
    telverneck#hotmail.com      Oops. Informe um email válido!

Empty login
    [Template]      Tentar logar
    ${Empty}        Oops. Informe um email válido!

*** Keywords ***
Tentar logar
    [Arguments]     ${emailLogin}   ${expect_message}

    Dado que acesso a pagina de login
    Quando submeto com o login "${emailLogin}"
    Entao devo ver a mensagem alerta "${expect_message}"



