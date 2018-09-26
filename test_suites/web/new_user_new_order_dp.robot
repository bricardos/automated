*** Settings ***
Test Setup        Initialize Test Data
Test Teardown     Close Browser
Library           Selenium2Library
Resource          student/register.robot
Resource          student/my_account.robot
Resource          student/profile.robot
Resource          student/order.robot
Resource          student/order_status.robot
Resource          student/head_menu.robot
Resource          admin/login.robot
Resource          admin/menu.robot
Resource          admin/document_verification.robot
Resource          admin/assign_ambassador_verification.robot
Resource          admin/order.robot
Resource          ../helper/subscribe_otp.robot
Resource          ../helper/payment.robot

*** Test Cases ***
Register, Place An Order, Verify, Assign Ambassador, and Approve
    Open Selenium Browser    https://marvel-staging.cicil.co.id/
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
    Go To Home
    Search Product To Order
    Simulate Credit And Submit Order
    Confirm Detail Order
    Close Browser
    Open Selenium Browser    https://marvel-staging-old.cicil.co.id/
    Login Admin User    dev@cicil.co    Rahasia1
    Go To    https://marvel-staging-old.cicil.co.id/cicil4j4
    Go To Admin Verification Menu
    Switch To Verification Tab    Document
    Search Verification List By Email    ${userEmail}    Pending
    Select From Verification List By Email    ${userEmail}
    Start Verification Process
    Answer Verification    Does the ID card originals    yes
    Answer Verification    Does the ID Card information readable?    yes
    Answer Verification    Does the ID card number match?    yes
    Answer Verification    Does the name on the ID match?    yes
    Answer Verification    Does the person email match his name?    yes
    Answer Verification    Does the selfie photo taken properly?    yes
    Answer Verification    Does the person in the selfie match the photo on his cards?    yes
    Answer Verification    Does the permanent address match the address on KTP?    yes
    Answer Verification    Does the Student Card Original    yes
    Answer Verification    Is Currently a student    yes
    Answer Verification    Does his current address match his university city    yes
    Answer Verification    Do Guardian contacts is real?    yes
    Complete Data Verification    Complete Data Verification
    Go To Admin Verification Menu
    Go to Admin Assign Ambassador
    Comment    Switch To Verification Tab    Assign Ambassador
    Search Assign Ambassador List By Email    ${userEmail}
    Select From Assign Ambassador List By Email    ${userEmail}
    ${orderNo}    Assign Ambassador
    Go To Admin Order Menu
    Search Order List By Criteria    ${orderNo}    Order No
    Select From Order List By Criteria    ${orderNo}    Order No
    Approve Order
    Close Browser
    Open Selenium Browser    https://staging-beta.cicil.co.id/
    Login User    ${userEmail}    ${userPassword}
    Go To My Account
    Go To My Order Status
    ${amount}    ${virtualAccount}    Pay Down Payment By Order    ${orderNo}
    Payment API    dev@cicil.co    Rahasia1    ${amount}    ${virtualAccount}

*** Keywords ***
Initialize Test Data
    Initialize Registration Data
    Initialize All Profile Data

Open Selenium Browser
    [Arguments]    ${url}
    Open Browser    ${url}    chrome
    Maximize Browser Window
