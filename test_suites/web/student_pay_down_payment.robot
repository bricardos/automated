*** Settings ***
Test Teardown     Close Browser
Library           Selenium2Library
Resource          student/login.robot
Resource          student/my_account.robot
Resource          student/order_status.robot
Resource          ../helper/payment.robot

*** Test Cases ***
Pay Down Payment
    Open Browser    https://marvel-staging.cicil.co.id/    chrome
    Maximize Browser Window
    Run Pay Down Payment    ORD180607-179456    True    xball@woods-garcia.info    Rahasia1

*** Keywords ***
Run Pay Down Payment
    [Arguments]    ${order}    ${needLogin}=False    ${email}=default    ${password}=default
    Run Keyword If    ${needLogin}    Login User    ${email}    ${password}
    Go To My Account
    Go To My Order Status
    ${amount}    ${virtualAccount}    Pay Down Payment By Order    ${order}
    Payment API    dev@cicil.co    Rahasia1    ${amount}    ${virtualAccount}
