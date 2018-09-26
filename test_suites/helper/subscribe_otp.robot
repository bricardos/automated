*** Settings ***
Library           RequestsLibrary
Library           String

*** Variables ***
${otpSessionName}    otpAcceptor
${otpApiToken}    +6285574670301
${otpApiUrl}      http://35.231.255.81

*** Keywords ***
Unified OTP Phone Number Token Format
    ${otpApiToken}    Replace String    ${otpApiToken}    +    ${EMPTY}
    Set Test Variable    ${otpClearPath}    /clear/${otpApiToken}
    Set Test Variable    ${otpSubscribePath}    /subscribe/${otpApiToken}?tpl=cicil

Clear OTP
    Unified OTP Phone Number Token Format
    Create Session    ${otpSessionName}    ${otpApiUrl}
    ${resp}=    Get Request    ${otpSessionName}    ${otpClearPath}
    Should Be Equal As Strings    ${resp.status_code}    200

Subscribe OTP
    Unified OTP Phone Number Token Format
    Create Session    ${otpSessionName}    ${otpApiUrl}
    Log To Console    ${otpApiUrl}${otpSubscribePath}
    ${resp}=    Get Request    ${otpSessionName}    ${otpSubscribePath}
    Should Be Equal As Strings    ${resp.status_code}    200
    ${jsondata}=    To Json    ${resp.content}
    [Return]    ${jsondata['otp']}

Clear And Subscribe OTP
    Unified OTP Phone Number Token Format
    Create Session    ${otpSessionName}    ${otpApiUrl}
    ${resp}=    Get Request    ${otpSessionName}    ${otpClearPath}
    Should Be Equal As Strings    ${resp.status_code}    200
    ${resp}=    Get Request    ${otpSessionName}    ${otpSubscribePath}
    Should Be Equal As Strings    ${resp.status_code}    200
    ${jsondata}=    To Json    ${resp.content}
    [Return]    ${jsondata['otp']}
