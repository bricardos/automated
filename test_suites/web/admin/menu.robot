*** Settings ***
Library           Selenium2Library

*** Variables ***
${generalTimeout}    30s
${adminMenuContainer}    //admin_sidenav
${adminMenuVerification}    ${adminMenuContainer}//div[text()="Verification"]
${adminMenuOrder}    ${adminMenuContainer}//div[text()="Orders"]
${tabVerification}    //admin-verification-component
${tabVerificationMenu}    ${tabVerification}//ul/li
${adminMenuAssignAmbassador}    ${adminMenuContainer}//div[text()="Campus Coordinator"]

*** Keywords ***
Go To Admin Verification Menu
    Wait Until Element Is Visible    ${adminMenuVerification}    timeout=${generalTimeout}
    Click Element    ${adminMenuVerification}

Go To Admin Order Menu
    Wait Until Element Is Visible    ${adminMenuOrder}    timeout=${generalTimeout}
    Click Element    ${adminMenuOrder}

Switch To Verification Tab
    [Arguments]    ${menu}
    Wait Until Element Is Visible    ${tabVerificationMenu}    timeout=${generalTimeout}
    Click Element    ${tabVerificationMenu}[contains(text(), "${menu}")]

Go to Admin Assign Ambassador
    Wait Until Element Is Visible    ${adminMenuAssignAmbassador}    timeout=${generalTimeout}
    Click Element    ${adminMenuAssignAmbassador}
