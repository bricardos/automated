*** Settings ***
Library           FakerLibrary
Resource          ../../helper/subscribe_otp.robot
Resource          ../../helper/activate_email.robot
Resource          login.robot

*** Variables ***
${generalTimeout}    30s
${buttonRegister}    xpath=//button[text()="Daftar"]
${formRegister}    xpath=//h4[text()="Selamat datang di CICIL"]
${formRegisterEmail}    xpath=//input[@id="email"]
${formRegisterPhone}    xpath=//input[@id="phonenumber"]
${formRegisterPassword}    xpath=//input[@id="password"]
${formRegisterVerifyPassword}    xpath=//input[@id="verify_password"]
${formRegisterSubmit}    xpath=//cicil-button-submit//button[text()="Daftar"]
${formRegisterConfirm}    xpath=//h4[text()="Konfirmasi data diri"]
${formRegisterConfirmYes}    xpath=//button[text()="Ya, sudah benar"]
${formRegisterConfirmNo}    xpath=//button[text()="Tidak, masih salah"]
${formRegisterOTPConfirm}    xpath=//h4[text()="Verifikasi Handphone"]
${formRegisterOTPConfirmOTP}    xpath=//input[@id="otp"]
${formRegisterOTPConfirmYes}    xpath=//button[text()="Lanjut"]
${formRegisterOTPConfirmNo}    xpath=//button[contains(text(), "Kirim ulang code OTP")]
${formRegisterEmailConfirm}    xpath=//h4[text()="Verifikasi Email"]
${formRegisterEmailConfirmYes}    xpath=//button[text()="Saya sudah verifikasi"]
${formRegisterEmailConfirmNo}    xpath=//buton[text()="Kirim ulang link verifikasi"]

*** Keywords ***
Initialize Registration Data
    ${email}=    FakerLibrary.email
    Set Test Variable    ${userEmail}    ${email}
    Set Test Variable    ${userPhone}    +6285574670301
    Set Test Variable    ${userPassword}    Rahasia1

Open Student Registration Form
    Wait Until Element Is Visible    ${buttonRegister}    timeout=${generalTimeout}
    Click Element    ${buttonRegister}

Fill In Registration Form
    Wait Until Element Is Visible    ${formRegister}    timeout=${generalTimeout}
    Input Text    ${formRegisterEmail}    ${userEmail}
    Input Text    ${formRegisterPhone}    ${userPhone}
    Input Text    ${formRegisterPassword}    ${userPassword}
    Input Text    ${formRegisterVerifyPassword}    ${userPassword}
    Click Element    ${formRegisterSubmit}

Confirm Registration Data
    Wait Until Element Is Visible    ${formRegisterConfirm}    timeout=${generalTimeout}
    Click Element    ${formRegisterConfirmYes}

Confirm Registration OTP
    Wait Until Element Is Visible    ${formRegisterOTPConfirm}    timeout=${generalTimeout}
    ${otp}=    Clear And Subscribe OTP
    Input Text    ${formRegisterOTPConfirmOTP}    ${otp}
    Click Element    ${formRegisterOTPConfirmYes}

Confirm Registration Email
    Wait Until Element Is Visible    ${formRegisterEmailConfirm}    timeout=${generalTimeout}
    Activate Email With Login Session    ${userEmail}    ${userPassword}
    Click Element    ${formRegisterEmailConfirmYes}
