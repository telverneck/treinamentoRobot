*** Settings ***
Documentation       Anuncio
...                 Para que eu criar novos anuncios para locação
...                 Sendo um usuario que possuo um cadastro
...                 Quero poder incluir um anuncio

Resource            ../resources/steps_kw.robot

Suite Setup          Start Session
Suite Teardown       End Session

Test Teardown       End Test

*** Test Cases ***
Anunciar bike
    Dado eu estou na pagina de anuncios
    
