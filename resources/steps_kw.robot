*** Settings ***
Resource    base.robot
Library     ./lib/mongo.py


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

E eu acesso o formulario de cadastro de anuncio
    Click link              /new

Quando eu faço o anuncio desta bike
    Choose file             ${thumbnailInput}           ${CURDIR}/images/${bike_json['thumb']}
    Clear Element Text      ${bikeName}
    Input text              ${bikeName}                 ${bike_json['name']}
    Clear Element Text      ${bikeBrand}
    Input text              ${bikeBrand}               ${bike_json['brand']}
    Input text              ${bikePrice}                ${bike_json['price']}
    click button            ${bikeRegister}
    sleep                   3

Entao devo ver minha bike na lista de anuncios
    Wait until element is visible       ${bikeList}              
    Element should contain              ${bikeItem}               ${bike_json['name']}

E o valor da locação deve ser igual a "${expect_price}"
    Element should contain      ${bikeItem}               ${expect_price}

Entao devo ver uma mensagem de erro "${expect_message}"
    Element Text should be           ${alertError}                           ${expect_message}