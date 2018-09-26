*** Keywords ***
Convert Currency To Integer
  [Arguments]   ${text}
  ${output}                               Remove String         ${text}   Rp
  ${output}                               Replace String        ${output}   " "   ${EMPTY}
  ${output}                               Remove String         ${output}   .
  ${output}                               Convert To Integer    ${output}
  [Return]    ${output}
