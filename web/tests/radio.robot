*** Settings ***
Resource     base.robot

Test Setup      Nova sessao
Test Teardown   Encerra sessao  

*** Variables ***
${movies}                   movies
${select_valid_id}               cap 
${select_valid_value}         guardians 

*** Test Cases ***
Should select radio button with ID
    Go To                           ${url}/radios
    Select Radio button             ${movies}       ${select_valid_id}
    radio button Should be set To   ${movies}       ${select_valid_id}

Should select radio button with Value
    Go To                           ${url}/radios
    Select Radio button             ${movies}       ${select_valid_value}
    radio button Should be set To   ${movies}       ${select_valid_value}