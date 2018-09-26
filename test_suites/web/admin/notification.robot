*** Settings ***
Resource        ../../helper/javascript_action.robot

*** Variables ***
${generalTimeout}                 30s

${adminNotificationContainer}      //div[contains(@class, "notification")]

*** Keywords ***
Wait Until Admin Notification Is Shown
  [Arguments]   ${text}

  Wait Until Element Is Visible   ${adminNotificationContainer}/span[contains(text(), ${text})]      timeout=${generalTimeout}

