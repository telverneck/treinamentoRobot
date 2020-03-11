*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}              http://training-wheels-protocol.herokuapp.com

*** Keywords ***
Nova sessao
    Open browser        ${url}      chrome

Encerra sessao
    Capture Page Screenshot
    Close browser
