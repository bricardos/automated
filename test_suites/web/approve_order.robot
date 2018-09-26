*** Settings ***
Library                 Selenium2Library

Resource                admin/login.robot
Resource                admin/menu.robot
Resource                admin/order.robot

Test Teardown           Close Browser

*** Test Cases ***
Assign Ambassador
  Open Browser    %{TARGET_BACK_URL}   chrome    remote_url=%{SELENIUM_HUB_URL}
  Maximize Browser Window

  Run Assign Ambassador

*** Keywords ***
Run Assign Ambassador
  Login Admin User                              %{BACK_USER_EMAIL}  %{BACK_USER_PASSWORD}

  Go To                                         %{TARGET_BACK_URL}/cicil4j4

  Go To Admin Order Menu

  Search Order List By Criteria                 ORD180604-100749   Order No
  Select From Order List By Criteria            ORD180604-100749   Order No

  Approve Order
