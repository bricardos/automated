*** Settings ***
Library                 Selenium2Library

Resource                admin/login.robot
Resource                admin/menu.robot
Resource                admin/document_verification.robot

Test Teardown           Close Browser

*** Test Cases ***
Verify User
  Open Browser    %{TARGET_BACK_URL}   chrome    remote_url=%{SELENIUM_HUB_URL}
  Maximize Browser Window

  Run Verify User

*** Keywords ***
Run Verify User
  Login Admin User                        %{BACK_USER_EMAIL}  %{BACK_USER_PASSWORD}

  Go To                                   %{TARGET_BACK_URL}/cicil4j4

  Go To Admin Verification Menu
  Switch To Verification Tab              Document

  Search Verification List By Email       %{FRONT_USER_EMAIL}     Pending
  Select From Verification List By Email  %{FRONT_USER_EMAIL}
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
