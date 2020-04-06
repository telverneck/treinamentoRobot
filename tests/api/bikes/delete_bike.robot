*** Settings ***
Resource    ../../../resources/services.robot

Test Setup    Create Session    bikelov    ${base_url}

*** Test Cases ***
Delete unique bike
    ${user_id}=    Get user ID        telverneck15@gmail.com 
    ${bike_ad}=    Convert to Json    {"name": "Caloi", "brand": "Caloi", "price": "50", "thumbnail": "vulcan.jpg"} 

    ${bike_ad_id}=    Create bike ad    ${bike_ad}    ${user_id}

    ${resp}=                           Delete bike ad by ID      ${bike_ad_id}          ${user_id}
    log                                ${resp.text}
    Should be Equal As Strings         ${resp.status_code}    204

Bike ad not found
    ${user_id}=       Get user ID          telverneck15@gmail.com
    ${bike_ad_id}=    Get mongo Id 
    
    ${resp}=          Delete bike ad by ID    ${bike_ad_id}             ${user_id}
    log               ${resp.text}

    Should be Equal As Strings    ${resp.status_code}    204

Not authorized
    ${bike_ad_id}=    Get mongo Id 
    ${resp}=          Delete bike ad by ID    ${bike_ad_id}             ${EMPTY}
    log               ${resp.text}

    Should be Equal As Strings    ${resp.status_code}    401