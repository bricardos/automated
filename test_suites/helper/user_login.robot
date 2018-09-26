*** Settings ***
Library           RequestsLibrary

*** Variables ***
${loginSessionName}    loginAcceptor
${loginActivatePath}    /ciciluser
${loginApiUrl}    https://marvel-api.cicil.co.id/v1

*** Keywords ***
Login User API
    [Arguments]    ${email}    ${password}
    Create Session    ${loginSessionName}    ${loginApiUrl}
    ${data}=    Set Variable    {"username":"${email}","password":"${password}"}
    Log To Console    ${data}
    ${resp}=    Post Request    ${loginSessionName}    ${loginActivatePath}    data=${data}
    Should Be Equal As Strings    ${resp.status_code}    200
    [Return]    ${loginSessionName}
