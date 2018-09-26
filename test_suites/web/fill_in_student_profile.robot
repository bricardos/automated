*** Settings ***
Library                   Selenium2Library

Resource                  student/login.robot
Resource                  student/my_account.robot
Resource                  student/profile.robot

Test Setup                Initialize Test Data
Test Teardown             Close Browser

*** Test Cases ***
Fill In Student Profiles
  Open Browser    %{TARGET_FRONT_URL}   chrome    remote_url=%{SELENIUM_HUB_URL}
  Maximize Browser Window

  Run Fill In Student Profiles    True    %{FRONT_USER_EMAIL}   %{FRONT_USER_PASSWORD}

*** Keywords ***
Initialize Test Data
  Initialize All Profile Data

Run Fill In Student Profiles
  [Arguments]   ${needLogin}=False    ${email}=default ${EMPTY}    ${password}=default ${EMPTY}

  Run Keyword If    ${needLogin}    Login User    ${email}    ${password}
  Go To My Account
  Go To My Profile Account
  Fill In Personal Profile
  Fill In Academic Profile
  Fill In Address Profile
  Fill In Guardian Profile
  Accept Profile Agreement
  Go To My Account

