*** Settings ***
Test Setup        Initialize Test Data
Library           Selenium2Library
Resource          student/register.robot
Resource          student/my_account.robot
Resource          student/profile.robot

*** Test Cases ***
Register And Fill In Profiles
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

*** Keywords ***
Initialize Test Data
    Initialize Registration Data
    Initialize All Profile Data
