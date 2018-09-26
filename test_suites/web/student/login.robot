*** Settings ***
Resource                                notification.robot

*** Variables ***
${generalTimeout}                       30s

${buttonLogin}                          xpath=//a[text()="Masuk"]

${formLogin}                            xpath=//h4[text()="Selamat datang kembali di CICIL"]
${formLoginEmail}                       xpath=//input[@id="username"]
${formLoginPassword}                    xpath=//input[@id="password"]
${formLoginSubmit}                      xpath=//button[text()="Masuk"]

*** Keywords ***
Login User
  [Arguments]   ${email}    ${password}
  Wait Until Element Is Visible         ${buttonLogin}                        timeout=${generalTimeout}

  Click Element                         ${buttonLogin}

  Wait Until Element Is Visible         ${formLogin}                          timeout=${generalTimeout}

  Input Text                            ${formLoginEmail}                     ${email}
  Input Text                            ${formLoginPassword}                  ${password}
  Click Element                         ${formLoginSubmit}

  Wait Until Notification Is Shown     text="Hai"

