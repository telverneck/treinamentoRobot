*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${url}      http://bikelov.herokuapp.com
${emailID}                id:email 

*** Keywords ***
Start Session
    Open browser                    about:blank        chrome
    Set Selenium implicit wait      5

End Session
    Close browser

Logged with ${email}
    Start Session
    Go To                           ${url}
    input text                      ${emailID}                            ${email}
    click button                    ${buttonEnter}
    Page should contain element     ${dashboard}

End Test
    Capture Page Screenshot