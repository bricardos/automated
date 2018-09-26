*** Variables ***
${generalTimeout}               30s

*** Keywords ***
Get Admin Form Text Inside Div
  [Arguments]   ${label}
  ${selector}   Set Variable    //label[contains(text(), "${label}")]/following-sibling::div/input

  Wait Until Element Is Visible   ${selector}      timeout=${generalTimeout}
  ${output}     Get Value         ${selector}

  [Return]      ${output}

Get Admin Form Text
  [Arguments]   ${label}
  ${selector}   Set Variable    //label[contains(text(), "${label}")]/following-sibling::input

  Wait Until Element Is Visible   ${selector}      timeout=${generalTimeout}
  ${output}     Get Value         ${selector}

  [Return]      ${output}
