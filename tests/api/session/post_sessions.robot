*** Settings ***
Resource    ../../../resources/services.robot

Test Setup      Create Session          bikelov         ${base_url}

*** Test Cases ***
User Session
    
    ${payload}=             Convert to Json         {"email": "jason.toddy@dc.com"}    
    ${resp}=                Post Session            ${payload} 

    Should be Equal As Strings          ${resp.status_code}     200

Wrong Email
    ${payload}=             Convert to Json         {"email": "jason.toddy$dc.com"}
    ${resp}=                Post Session            ${payload} 

    Should be Equal As Strings          ${resp.status_code}     409

Empty Email
    ${payload}=             Convert to Json         {"email": ""}
    ${resp}=                Post Session            ${payload}
    Should be Equal As Strings          ${resp.status_code}     412

Without Data
    ${payload}=             Convert to Json         {}
    ${resp}=                Post Session            ${payload}

    Should be Equal As Strings          ${resp.status_code}     412

