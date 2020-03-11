*** Settings ***
Resource     base.robot

Test Setup      Nova sessao
Test Teardown   Encerra sessao  

*** Variables ***
${table}                       id:actors

*** Test Cases ***
Validate table lines
    Go To                           ${url}/tables
    Table Row should contain        ${table}    1   $ 10.000.000    

Find line by text
    Go To                                   ${url}/tables
    ${target}=          get webElement      xpath:.//tr[contains(., '@chadwickboseman')]
    log                 ${target.text} 
    log to console      ${target.text} 
    should contain      ${target.text}      $ 700.000
    should contain      ${target.text}      Pantera Negra

   
