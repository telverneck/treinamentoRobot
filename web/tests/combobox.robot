*** Settings ***
Resource     base.robot

Test Setup      Nova sessao
Test Teardown   Encerra sessao  

*** Variables ***
${valid_class}                      class:avenger-list
${valid_id}                         id:dropdown

*** Test Cases ***
Select an option in dropdown list using Text and validate by value
    Go To                           ${url}/dropdown
    Select from list by label       ${valid_class}              Scott Lang
    ${Selected}=                    Get Selected list Value     ${valid_class}
    should be equal                 ${Selected}                 7      

Select an option in dropdown list using Value and validate by Text
    Go To                           ${url}/dropdown
    Select from list by Value       ${valid_id}                     6
    ${Selected}=                    Get Selected list label         ${valid_id} 
    should be equal                 ${Selected}                     Loki     
