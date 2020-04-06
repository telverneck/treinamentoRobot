*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     OperatingSystem
Library     lib/mongo.py


Resource    helpers.robot

*** Variables ***
${base_url}=        http://bikelov-api.herokuapp.com


*** Keywords ***
### /sessions
Post Session 
    [Arguments]         ${payload}
    &{headers}=         Create Dictionary       Content-Type=application/json
    
    ${resp}=            Post Request     bikelov      /sessions     data=${payload}     headers=${headers}
    [Return]            ${resp} 

Get user ID
    [Arguments]         ${email}
    ${payload}=         Convert to Json         {"email": "${email}"}
    ${resp}=            Post Session            ${payload}
    ${user_id}=         Convert to String       ${resp.json()['_id']}
    [Return]            ${user_id}

### /bikes

Post bike
    [Arguments]         ${user_id}          ${payload}      ${thumb}

    &{headers}=         Create Dictionary   user_id=${user_id}

    ${file_bin}=        Get Binary File         ${CURDIR}/images/${thumb}
    &{files}=           Create Dictionary       thumbnail=${file_bin}
    
    ${resp}=            Post Request     bikelov      /bikes     data=${payload}     headers=${headers}     files=${files}
    [Return]            ${resp}      
