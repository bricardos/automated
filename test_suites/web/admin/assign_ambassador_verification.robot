*** Settings ***
Resource                                form.robot
Resource                                ../../helper/dropdown_selector.robot

*** Variables ***
${generalTimeout}                       30s

${groupTableAssignAmbassador}           //admin_table_serverside
${formSearch}                           ${groupTableAssignAmbassador}//ssd_search
${formSearchCategory}                   ${formSearch}//select
${formSearchCriteria}                   ${formSearch}//input[@placeholder="search"]

${tableAssignAmbassador}                ${groupTableAssignAmbassador}//table

${buttonAssignAmbassador}               //button[text()="Assign Ambassador"]

${formAssignAmbassadorEmail}            //label[@for="assigned_ambassador"]/following-sibling::input
${formAssignAmbassadorSubmit}           //button[text()="Proceed"]

*** Keywords ***
Select From Assign Ambassador List By Email
  [Arguments]   ${email}

  ${selectedRow}    Set Variable            ${tableAssignAmbassador}//td//*[contains(text(), "${email}")]
  Wait Until Element Is Visible             ${selectedRow}      timeout=${generalTimeout}

  Click Element                             ${selectedRow}

Search Assign Ambassador List By Email
  [Arguments]   ${email}
  Wait Until Element Is Visible             ${formSearch}      timeout=${generalTimeout}

  Select From List By Label                 ${formSearchCategory}               Email
  Input Text                                ${formSearchCriteria}               ${email}

Assign Ambassador
  Wait Until Element Is Visible             ${buttonAssignAmbassador}      timeout=${generalTimeout}

  ${output}                                 Get Admin Form Text Inside Div                Order #

  Click Element                             ${buttonAssignAmbassador}

  Wait Until Element Is Visible             ${formAssignAmbassadorEmail}      timeout=${generalTimeout}

  Select Non Searchable Dropdown            ${formAssignAmbassadorEmail}        a

  Click Element                             ${formAssignAmbassadorSubmit}

  Wait Until Element Is Visible             ${groupTableAssignAmbassador}      timeout=${generalTimeout}


  [Return]    ${output}
