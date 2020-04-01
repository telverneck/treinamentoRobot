*** Settings ***
Documentation       Anuncio
...                 Para que eu criar novos anuncios para locação
...                 Sendo um usuario que possuo um cadastro
...                 Quero poder incluir um anuncio

Resource            ../resources/steps_kw.robot

Suite Setup          Run Keywords       Logged with telverneck@hotmail.com
...                  AND                E eu acesso o formulario de cadastro de anuncio
Suite Teardown       End Session

Test Teardown       End Test

Test Template       Anuncio nao cadastrado


*** Test Cases ***      bike            error
#Sem foto no anuncio     ${no_thumb}     Precisamos de uma foto para o seu anúncio!
Nao informa o nome      ${no_name}      Informe a descrição do anúncio!
Nao informa a marca     ${no_brand}     Informe a marca da sua Bike :)



*** Keywords ***
Anuncio nao cadastrado
    [Arguments]         ${bike}         ${error}
    Dado eu tenho uma ${bike}
    Quando eu faço o anuncio desta bike
    Entao devo ver uma mensagem de erro "${error}"

