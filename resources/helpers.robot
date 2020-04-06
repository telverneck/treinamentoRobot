

*** Keywords ***


### Helpers
Convert to Json
    [Arguments]         ${target}

    ${result}=      evaluate        json.loads($target)       json 
    [Return]        ${result}      