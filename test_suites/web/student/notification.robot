*** Settings ***
Resource        ../../helper/javascript_action.robot

*** Variables ***
${generalTimeout}             30s

${notificationContainer}      //div[contains(@class, "notification-container")]

*** Keywords ***
Wait Until Notification Is Shown
  [Arguments]   ${text}

  Wait Until Element Is Visible   ${notificationContainer}/div[contains(text(), ${text})]      timeout=${generalTimeout}

