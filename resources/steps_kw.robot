*** Settings ***
Resource    base.robot

*** Variables ***
${email}                id:email
${buttonEnter}          xpath://button[contains(text(), "Entrar")]
${dashboard}            class:dashboard
${alert}                class:alert-dark

*** Keywords ***
Dado que acesso a pagina de login
    Go To       ${url} 

Quando submeto com o login "${emailLogin}"
    input text                      ${email}                            ${emailLogin}
    click button                    ${buttonEnter}

Entao devo ver a area logada
    Page should contain element     ${dashboard}

Entao devo ver a mensagem alerta "${expect_message}"
    Element Text should be           ${alert}                           ${expect_message}
