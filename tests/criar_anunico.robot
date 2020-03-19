*** Settings ***
Documentation       Anuncio
...                 Para que eu criar novos anuncios para locação
...                 Sendo um usuario que possuo um cadastro
...                 Quero poder incluir um anuncio

Resource            ../resources/steps_kw.robot

Suite Setup          Logged with "telverneck@hotmail.com"
Suite Teardown       End Session

Test Teardown       End Test

*** Variables ***
${bike}=            {"name": "Rocker 26 marchas", "brand": "Shimano", "price":"15" }

*** Test Cases ***
Anunciar bike
    Dado eu tenho uma ${bike}
    Quando eu faço o anuncio desta bike
    #Entao devo ver minha bike na lista de anuncios

