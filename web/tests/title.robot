*** Settings ***
Resource     base.robot

Test Setup      Nova sessao
Test Teardown   Encerra sessao  


*** Test Cases ***
Should return Page Title
    Title Should Be     Training Wheels Protocol
