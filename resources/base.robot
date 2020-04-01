*** Settings ***
Library             SeleniumLibrary

Resource            elements.robot

*** Keywords ***
Start Session
    Open browser                    about:blank         chrome
    Set Selenium implicit wait      10
    Set window size                 1440                900

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