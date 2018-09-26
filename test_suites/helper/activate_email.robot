*** Settings ***
Library           RequestsLibrary
Resource          user_login.robot

*** Variables ***
${emailSessionName}    emailAcceptor
${emailActivatePath}    /registration/activate_email
${emailApiUrl}    https://marvel-api.cicil.co.id/v1

*** Keywords ***
Activate Email With Login Session
    [Arguments]    ${email}    ${password}
    ${session}=    Login User API    ${email}    ${password}
    ${resp}=    Get Request    ${session}    ${emailActivatePath}
    Should Be Equal As Strings    ${resp.status_code}    200
