*** Settings ***
Resource    base.robot
Library     ./lib/mongo.py

*** Variables ***
${email}                id:email
${buttonEnter}          xpath://button[contains(text(), "Entrar")]
${dashboard}            class:dashboard
${alert}                class:alert-dark
${buttonAnunciar}       //button[contains(text(), "Criar")]

*** Keywords ***
# Login
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
    Remove bike             ${bike_json['name']}

Quando eu faço o anuncio desta bike
    click button            ${buttonAnunciar}

    Choose file             css:#thumbnail input                                                ${CURDIR}/images/${bike_json['thumb']}
    Input text              id:name                                                             ${bike_json['name']}
    Input text              id:brand                                                            ${bike_json['brand']}
    Input text              xpath://input[@placeholder = "Valor cobrado por dia"]               ${bike_json['price']}
    click button            css:.btn-red
    sleep                   3

Entao devo ver minha bike na lista de anuncios
    Wait until element is visible       css:.bike-list li              
    Element should contain              css:.bike-list               ${bike_json['name']}

E o valor da locação deve ser igual a "${expect_price}"
    Element should contain      css:.bike-list               ${expect_price}
