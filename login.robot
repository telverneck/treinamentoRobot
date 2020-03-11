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
    Acesso website
    Efetuar login com "telverneck@hotmail.com"
    exibir area logada
    fecho navegador
  
Login invalid user
    Acesso website
    Efetuar login com "telvern"
    ver mensagem alerta "Oops. Informe um email válido!"
    fecho navegador

Empty login
    Acesso website
    Efetuar login com "${Empty}"
    ver mensagem alerta "Oops. Informe um email válido!"
    fecho navegador

*** Keywords ***
Acesso website
    Open browser                    http://bikelov.herokuapp.com        chrome
    Set Selenium implicit wait      5

Efetuar login com "${emailLogin}"
    input text                      ${email}                            ${emailLogin}
    click button                    ${buttonEnter}

exibir area logada
    Page should contain element     ${dashboard}

ver mensagem alerta "${expect_message}"
    Element Text should be           ${alert}                           ${expect_message}

fecho navegador
    Close browser
