*** Settings ***
Resource    base.robot

*** Variables ***
${email}                id:email
${buttonEnter}          xpath://button[contains(text(), "Entrar")]
${dashboard}            class:dashboard
${alert}                class:alert-dark
${buttonAnunciar}       //button[contains(text(), "Criar")]

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

# Anuncios
Dado eu tenho uma ${bike_string}
    ${bike_json}=           evaluate                json.loads($bike_string)      json
    log                     ${bike_json}
    Set test Variable       ${bike_json}

Quando eu faço o anuncio desta bike
    click button            ${buttonAnunciar}
    Input text              id:name                                      ${bike_json['name']}
    Input text              id:brand                                     ${bike_json['brand']}
    Input text              css:input[placeholder$='dia']                ${bike_json['price']}
    sleep                   3