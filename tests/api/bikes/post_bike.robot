
*** Settings ***

Resource    ../../../resources/services.robot

Test Setup    Create Session    bikelov    ${base_url}

*** Test Cases ***
Create bike
    ${user_id}=    Get user ID           telverneck@hotmail.com                                            
    ${payload}=    Convert to Json       {"name": "Elleven Rocker", "brand": "Shimano", "price": "15"} 
    Remove bike    ${payload['name']}

    ${resp}=    Post bike    ${user_id}    ${payload}    elleven.jpg

    Should be Equal As Strings    ${resp.status_code}    200

Empty name
    [Template]                                         Required fields
    {"name": "", "brand": "Shimano", "price": "15"}    1001               Bike name is required

Empty brand
    [Template]                                        Required fields
    {"name": "Rocker", "brand": "", "price": "15"}    1002               Brand is required


*** Keywords ***
Required fields
    [Arguments]    ${json}    ${expect_bcode}    ${expect_message}

    ${user_id}=    Get user ID           telverneck@hotmail.com    
    ${payload}=    Convert to Json       ${json} 
    Remove bike    ${payload['name']}

    ${resp}=    Post bike    ${user_id}    ${payload}    elleven.jpg

    Log    ${resp.text}

    ${business_code}    Convert to Integer    ${expect_bcode}

    Should be Equal As Strings         ${resp.status_code}       412
    Should be Equal                    ${resp.json()['code']}    ${business_code}
    Dictionary should contain value    ${resp.json()}            ${expect_message}
