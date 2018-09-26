*** Settings ***
Test Setup        Initialize Test Data
Library           Selenium2Library
Resource          student/register.robot
Resource          student/my_account.robot
Resource          student/profile.robot
Resource          student/order.robot
Resource          ../helper/subscribe_otp.robot

*** Test Cases ***
Register And Place An Order
    Open Browser    https://marvel-staging.cicil.co.id/    chrome
    Maximize Browser Window
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

*** Keywords ***
Initialize Test Data
    Initialize Registration Data
    Initialize All Profile Data
