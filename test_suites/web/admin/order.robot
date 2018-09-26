*** Settings ***
Resource                                form.robot
Resource                                ../../helper/dropdown_selector.robot

*** Variables ***
${generalTimeout}                       30s

${groupTableOrder}                      //admin_table_serverside
${formSearch}                           ${groupTableOrder}//ssd_search
${formSearchCategory}                   ${formSearch}//select
${formSearchCriteria}                   ${formSearch}//input[@placeholder="search"]

${tableOrder}                           ${groupTableOrder}//table

${buttonApproveOrder}                   //button[text()="Approve"]

${formOrderSubmit}                      //button[text()="Proceed"]

${buttonDetailOrder}                    //button[text()="Detail"]

*** Keywords ***
Select From Order List By Criteria
  [Arguments]   ${criteria}   ${category}=Order No

  ${selectedRow}    Set Variable            ${tableOrder}//td//*[contains(text(), "${criteria}")]
  Wait Until Element Is Visible             ${selectedRow}      timeout=${generalTimeout}

  Click Element                             ${selectedRow}

Search Order List By Criteria
  [Arguments]   ${criteria}   ${category}=Order No
  Wait Until Element Is Visible             ${formSearch}      timeout=${generalTimeout}

  Select From List By Label                 ${formSearchCategory}               ${category}
  Input Text                                ${formSearchCriteria}               ${criteria}

Approve Order
  Wait Until Element Is Visible             ${buttonApproveOrder}      timeout=${generalTimeout}

  Click Element                             ${buttonApproveOrder}

  Wait Until Element Is Visible             ${formOrderSubmit}      timeout=${generalTimeout}

  Click Element                             ${formOrderSubmit}

  Wait Until Element Is Visible             ${buttonDetailOrder}      timeout=${generalTimeout}

  ${status}                                 Get Admin Form Text                 Status

  Should Be Equal As Strings                ${status}                           waiting_downpayment
