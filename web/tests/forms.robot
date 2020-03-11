*** Settings ***
Resource     base.robot

Test Setup      Nova sessao
Test Teardown   Encerra sessao  

*** Variables ***
${login}            css:input[name=username]
${password}         css:input[name=password]
${button_login}     class:btn-login
${flash}            id:flash


*** Test Cases ***
Login com sucesso
    Go to                       ${url}/login
    Login with                  stark  jarvis!
    should see logged user      Tony Stark 

Senha invalida
    Go to                               ${url}/login
    Login with                          stark  SenhaInvalida!
    should contain login alert          Senha é invalida! 

login invalido
    Go to                               ${url}/login
    Login with                          LoginInvalido  SenhaInvalida!
    should contain login alert          O usuário informado não está cadastrado!

*** Keywords ***
Login with
    [Arguments]             ${username}             ${pass}
    input text              ${login}                ${username}
    input text              ${password}             ${pass}
    Click element           ${button_login}

should contain login alert
    [Arguments]             ${expect_message}
    ${message}=             get webElement          ${flash}
    should contain          ${message.text}         ${expect_message}

should see logged user
    [Arguments]             ${user}
    Page should contain     Olá, ${user}. Você acessou a área logada!