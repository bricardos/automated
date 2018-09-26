*** Settings ***
Library                   Selenium2Library

Resource                  student/login.robot
Resource                  student/order.robot

Test Teardown             Close Browser

*** Test Cases ***
Ordering Product
  Open Browser    %{TARGET_FRONT_URL}   chrome    remote_url=%{SELENIUM_HUB_URL}
  Maximize Browser Window

  Run Ordering Product                True    oconnortyler@hotmail.com   Rahasia1

*** Keywords ***
Run Ordering Product
  [Arguments]   ${needLogin}=False    ${email}=default ${EMPTY}    ${password}=default ${EMPTY}

  Run Keyword If    ${needLogin}    Login User    ${email}    ${password}

  Search Product To Order
  Simulate Credit And Submit Order
  Confirm Detail Order
