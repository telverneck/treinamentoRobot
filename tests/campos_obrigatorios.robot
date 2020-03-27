*** Settings ***
Documentation       Anuncio
...                 Para que eu criar novos anuncios para locação
...                 Sendo um usuario que possuo um cadastro
...                 Quero poder incluir um anuncio

Resource            ../resources/steps_kw.robot

Suite Setup          Logged with telverneck@hotmail.com
Suite Teardown       End Session

Test Teardown       End Test

Test Template       Anuncio nao cadastrado

*** Variables ***
${no_thumb}=            {"thumb": "","name": "Rocker 26 marchas", "brand": "Shimano", "price":"15" }
${no_name}=            {"thumb": "elleven.jpg","name": "", "brand": "Shimano", "price":"15" }
${no_brand}=            {"thumb": "elleven.jpg","name": "Rocker 26 marchas", "brand": "", "price":"15" }

*** Test Cases ***      bike            alert
#Sem foto no anuncio     ${no_thumb}     Precisamos de uma foto para o seu anúncio!
Nao informa o nome      ${no_name}      Informe a descrição do anúncio!
Nao informa a marca     ${no_brand}     Informe a marca da sua buke :)



*** Keywords ***
Anuncio nao cadastrado
    [Arguments]         ${bike}         ${message}
    Dado eu tenho uma ${bike}
    Quando eu faço o anuncio desta bike
    Entao devo ver uma mensagem de erro "${message}"

