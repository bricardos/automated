*** Settings ***
Resource                      notification.robot

*** Variables ***
${generalTimeout}                       30s

${buttonAdminLogin}                          xpath=//*[text()="Login/Register"]
${buttonAdminRegister}                       xpath=//*[text()="Register disini"]

${formAdminLogin}                            xpath=//ngb-modal-window
${formAdminLoginEmail}                       xpath=//input[@id="username"]
${formAdminLoginPassword}                    xpath=//input[@id="password"]
${formAdminLoginSubmit}                      xpath=//button[text()="Login"]

*** Keywords ***
Login Admin User
  [Arguments]   ${email}    ${password}
  Wait Until Element Is Visible         ${buttonAdminLogin}                        timeout=${generalTimeout}

  Click Element                         ${buttonAdminLogin}

  Wait Until Element Is Visible         ${formAdminLogin}                          timeout=${generalTimeout}

  Input Text                            ${formAdminLoginEmail}                     ${email}
  Input Text                            ${formAdminLoginPassword}                  ${password}
  Click Element                         ${formAdminLoginSubmit}

  Wait Until Admin Notification Is Shown      text="Selamat datang"
