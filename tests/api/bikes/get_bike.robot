*** Settings ***
Resource    ../../../resources/services.robot

Test Setup    Create Session    bikelov    ${base_url}

*** Test Cases ***
Get unique bike
    ${user_id}=    Get user ID        telverneck15@gmail.com 
    ${bike_ad}=    Convert to Json    {"name": "Elleven Rocker", "brand": "Shimano", "price": "15", "thumbnail": "elleven.jpg"} 

    ${bike_ad_id}=    Create bike ad    ${bike_ad}    ${user_id}

    ${resp}=                           Get bike ad by ID      ${bike_ad_id}          ${user_id}
    log                                ${resp.text}
    Should be Equal As Strings         ${resp.status_code}    200
    Dictionary should contain value    ${resp.json()}         ${bike_ad['name']}
    Dictionary should contain value    ${resp.json()}         ${bike_ad['brand']}
    Dictionary should contain value    ${resp.json()}         ${user_id}

Bike ad not found
    ${user_id}=       Get user ID          telverneck15@gmail.com
    ${bike_ad_id}=    Get mongo Id 
    ${resp}=          Get bike ad by ID    ${bike_ad_id}             ${user_id}
    log               ${resp.text}

    Should be Equal As Strings    ${resp.status_code}    404

Not authorized
    ${bike_ad_id}=    Get mongo Id 
    ${resp}=          Get bike ad by ID    ${bike_ad_id}             ${EMPTY}
    log               ${resp.text}

    Should be Equal As Strings    ${resp.status_code}    401