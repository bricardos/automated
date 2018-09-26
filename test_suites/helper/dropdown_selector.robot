*** Keywords ***
Select A Single Value From Dropdown
  [Arguments]  ${selector}  ${selectedValue}

  ${formDropdownInput}=   Set Variable  ${selector}//input

  Wait Until Element Is Visible       ${formDropdownInput}

  Input Text                          ${formDropdownInput}        ${selectedValue}
  Press Key                           ${formDropdownInput}        \\13

Select Non Searchable Dropdown
  [Arguments]  ${selector}  ${selectedValue}

  Wait Until Element Is Visible       ${selector}

  Input Text                          ${selector}        ${selectedValue}
  Press Key                           ${selector}        \\13

