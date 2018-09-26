*** Settings ***
Library                 Selenium2Library

Resource                student/register.robot
Resource                student/my_account.robot
Resource                student/profile.robot
Resource                student/order.robot

Resource                admin/login.robot
Resource                admin/menu.robot
Resource                admin/document_verification.robot

Resource                ../helper/subscribe_otp.robot

Test Setup              Initialize Test Data
Test Teardown           Close Browser

*** Test Cases ***
Register And Place An Order
  Open Selenium Browser                %{TARGET_FRONT_URL}

  Open Student Registration Form
  Fill In Registration Form
  Confirm Registration Data
  Confirm Registration OTP
  Confirm Registration Email

  Go To My Account
  Go To My Profile Account
  Fill In Personal Profile
  Fill In Academic Profile
  Fill In Address Profile
  Fill In Guardian Profile
  Accept Profile Agreement
  Go To My Account

  Search Product To Order
  Simulate Credit And Submit Order
  Confirm Detail Order

  Close Browser

  Open Selenium Browser                   %{TARGET_BACK_URL}

  Login Admin User                        %{BACK_USER_EMAIL}  %{BACK_USER_PASSWORD}

  Go To                                   %{TARGET_BACK_URL}/cicil4j4

  Go To Admin Verification Menu
  Switch To Verification Tab              Document

  Search Verification List By Email       ${userEmail}     Pending
  Select From Verification List By Email  ${userEmail}
  Start Verification Process
  Answer Verification                     Does the ID card originals    yes
  Answer Verification                     Does the ID Card information readable?    yes
  Answer Verification                     Does the ID card number match?   yes
  Answer Verification                     Does the name on the ID match?    yes
  Answer Verification                     Does the person email match his name?   yes
  Answer Verification                     Does the selfie photo taken properly?   yes
  Answer Verification                     Does the person in the selfie match the photo on his cards?   yes
  Answer Verification                     Does the permanent address match the address on KTP?    yes
  Answer Verification                     Does the Student Card Original    yes
  Answer Verification                     Is Currently a student    yes
  Answer Verification                     Does his current address match his university city    yes
  Answer Verification                     Do Guardian contacts is real?   yes
  Complete Data Verification              Complete Data Verification

*** Keywords ***
Initialize Test Data
  Initialize Registration Data
  Initialize All Profile Data

Open Selenium Browser
  [Arguments]     ${url}
  Open Browser    ${url}   chrome    remote_url=%{SELENIUM_HUB_URL}
  Maximize Browser Window
