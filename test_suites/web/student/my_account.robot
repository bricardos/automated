*** Settings ***
Library           Selenium2Library

*** Variables ***
${generalTimeout}    30s
${buttonMyAccount}    xpath=//*[contains(text(), "Akun Saya")]
${buttonMyProfileAccount}    xpath=//span[text()="Akun Profil"]
${buttonMyOrderStatus}    xpath=//span[text()="Status Pesanan"]
${buttonMyUserList}    ${EMPTY}

*** Keywords ***
Go To My Account
    Wait Until Element Is Visible    ${buttonMyAccount}    timeout=${generalTimeout}
    Click Element    ${buttonMyAccount}

Go To My Profile Account
    Wait Until Element Is Visible    ${buttonMyProfileAccount}    timeout=${generalTimeout}
    Click Element    ${buttonMyProfileAccount}

Go To My Order Status
    Wait Until Element Is Visible    ${buttonMyOrderStatus}    timeout=${generalTimeout}
    Click Element    ${buttonMyOrderStatus}

Go To My List User
    Wait Until Element Is Visible    ${buttonMyAccount}    timeout=${generalTimeout}
    Click Element    ${buttonMyUserList}
