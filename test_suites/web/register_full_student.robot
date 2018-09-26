*** Settings ***
Test Setup        Initialize Test Data
Test Teardown     Close Browser
Library           Selenium2Library
Resource          student/register.robot

*** Test Cases ***
Full Student Registration
    Open Browser    https://marvel-staging.cicil.co.id/    chrome
    Maximize Browser Window
    Run Full Student Registration

*** Keywords ***
Initialize Test Data
    Initialize Registration Data

Run Full Student Registration
    Open Student Registration Form
    Fill In Registration Form
    Confirm Registration Data
    Confirm Registration OTP
    Confirm Registration Email
