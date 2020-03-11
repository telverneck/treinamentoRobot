*** Settings ***
Resource     base.robot

Test Setup      Nova sessao
Test Teardown   Encerra sessao    

*** Variables ***
${check_thor}       id:thor  
${check_ironman}    css:input[value^=iron] 
${check_antman}     xpath://*[@id='checkboxes']/input[6] 


*** Test Cases ***
Check option with ID
    Go To                           ${url}/checkboxes
    Select checkbox                 ${check_thor}
    Checkbox Should Be Selected     ${check_thor}

Check option with CSS selector
    [tags]      ironman
    Go To                           ${url}/checkboxes
    Select checkbox                 ${check_ironman}
    Checkbox Should Be Selected     ${check_ironman}

Check option with Xpath
    [tags]      antman
    Go To                           ${url}/checkboxes
    Select checkbox                 ${check_antman}
    Checkbox Should Be Selected     ${check_antman}



