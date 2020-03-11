*** Settings ***
Documentation       Login
...                 Para que eu posssa ter acesso a area de anuncios
...                 Sendo um usuario que possuo um email
...                 Quero poder iniciar uma sessao

Library             SeleniumLibrary


*** Variables ***
${email}                id:email
${buttonEnter}          class:btn-red
${dashboard}            class:dashboard
${alert}                class:alert-dark



*** Test Cases ***
Login user
    Dado que acesso o website
    Quando submeto com o login "telverneck@hotmail.com"
    Entao devo ver a area logada
    E fecho navegador
  
Login invalid user
    Dado que acesso o website
    Quando submeto com o login "telvern"
    Entao devo ver a mensagem alerta "Oops. Informe um email válido!"
    E fecho navegador

Empty login
    Dado que acesso o website
    Quando submeto com o login "${Empty}"
    Entao devo ver a mensagem alerta "Oops. Informe um email válido!"
    E fecho navegador

*** Keywords ***
Dado que acesso o website
    Open browser                    http://bikelov.herokuapp.com        chrome
    Set Selenium implicit wait      5

Quando submeto com o login "${emailLogin}"
    input text                      ${email}                            ${emailLogin}
    click button                    ${buttonEnter}

Entao devo ver a area logada
    Page should contain element     ${dashboard}

Entao devo ver a mensagem alerta "${expect_message}"
    Element Text should be           ${alert}                           ${expect_message}

E fecho navegador
    Close browser
