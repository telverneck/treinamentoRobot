*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${url}      http://bikelov.herokuapp.com 

*** Keywords ***
Start Session
    Open browser                    about:blank        chrome
    Set Selenium implicit wait      5

End Session
    Close browser

End Test
    Capture Page Screenshot