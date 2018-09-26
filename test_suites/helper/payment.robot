*** Settings ***
Library           RequestsLibrary
Library           XML

Resource          user_login.robot

*** Variables ***
${paymentInquiryPath}               /payment/callback/doku/inquiry
${paymentNotifyPath}                /payment/callback/doku/notify

*** Keywords ***
Create Inquiry Dictionary
  [Arguments]   ${amount}   ${virtualAccount}
  ${output}     Create Dictionary
  ...   MALLID=4924
  ...   CHAINMERCHANT=0
  ...   AMOUNT=${amount}
  ...   WORDS=d68265033cdf4cc434f20787e0038ce4f0da4a10
  ...   PAYMENTCHANNEL=22
  ...   PAYMENTCODE=${virtualAccount}

  [Return]      ${output}

Create Notify Dictionary
  [Arguments]   ${amount}   ${virtualAccount}   ${merchantId}
  ${output}   Create Dictionary
  ...   MALLID=0
  ...   AMOUNT=${amount}
  ...   CHAINMERCHANT=0
  ...   TRANSIDMERCHANT=${merchantId}
  ...   WORDS=737cb3824d3c52be9b5f608b643f3ac0b26694a3
  ...   STATUSTYPE=P
  ...   RESPONSECODE=0
  ...   APPROVALCODE=102476957
  ...   RESULTMSG=SUCCESS
  ...   PAYMENTCHANNEL=34
  ...   PAYMENTCODE=${virtualAccount}
  ...   SESSIONID=session1
  ...   BANK=BRI
  ...   MCN=${virtualAccount}
  ...   PAYMENTDATETIME=20171119130851
  ...   VERIFYID=0
  ...   VERIFYSCORE=-1
  ...   VERIFYSTATUS=NA

  [Return]    ${output}

Payment API
  [Arguments]   ${email}    ${password}     ${amount}    ${virtualAccount}

  ${session}    Login User API      ${email}    ${password}

  ${data}       Create Inquiry Dictionary  ${amount}  ${virtualAccount}
  ${headers}    Create Dictionary   Content-Type=application/x-www-form-urlencoded
  ${resp}       Post Request        ${session}   ${paymentInquiryPath}    data=${data}    headers=${headers}
  Should Be Equal As Strings        ${resp.status_code}   200

  ${xmldata}      Parse Xml           ${resp.text}
  ${merchantId}   Get Element         ${xmldata}    TRANSIDMERCHANT

  ${data}       Create Notify Dictionary  ${amount}  ${virtualAccount}  ${merchantId.text}
  ${headers}    Create Dictionary   Content-Type=application/x-www-form-urlencoded
  ${resp}       Post Request        ${session}   ${paymentNotifyPath}     data=${data}    headers=${headers}
  Log To Console    ${resp.text}
  Should Be Equal As Strings        ${resp.status_code}   200
