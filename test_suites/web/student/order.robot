*** Settings ***
Resource                ../../helper/subscribe_otp.robot

*** Variables ***
${generalTimeout}                             30s

${formProductSearch}                          //input[@id="search_url"]
${formProductSampleUrl}                       //span[@id="sample_url"]
${formProductSubmit}                          //button[@type="submit"]

${formCreditDownpayment}                      //input[@formcontrolname="downpayment"]
${formCreditTenure}                           //select[@formcontrolname="tenure"]
${formCreditSubmitEnabled}                    //button[text()="Ajukan cicilan"]

${formDetailOrder}                            //h3[text()="Berikut adalah konfirmasi order kamu"]
${formDetailOrderDomicile}                    //h5[text()="Alamat Domisili"]
${formDetailOrderHomeStay}                    //h5[text()="Alamat Tinggal"]
${formDetailOrderAgreement}                   //label[@for="agree"]
${formDetailOrderSubmitEnabled}               //button[text()="CHECKOUT" and not(@disabled)]
${formDetailOrderOtp}                         //input[@id="otp"]
${formDetailOrderOtpSubmitEnabled}            //button[text()="Lanjut" and not(@disabled)]
${formDetailOrderSubmittedScreen}             //p[contains(text(), "Terima kasih sudah order lewat CICIL")]

*** Keywords ***
Search Product To Order
  Wait Until Element Is Visible     ${formProductSearch}      timeout=${generalTimeout}

  # Input Text                        ${formProductSearch}        ${EMPTY}
  Click Element                     ${formProductSampleUrl}

  Click Element                     ${formProductSubmit}

Simulate Credit And Submit Order
  Wait Until Element Is Visible     ${formCreditDownpayment}      timeout=${generalTimeout}

  # Input Text                        ${formCreditDownpayment}
  # Select From List                  ${formCreditTenure}

  Click Element                     ${formCreditSubmitEnabled}

Confirm Detail Order
  Wait Until Element Is Visible     ${formDetailOrder}      timeout=${generalTimeout}

  Click Element                     ${formDetailOrderHomeStay}
  Click Element                     ${formDetailOrderAgreement}
  Click Element                     ${formDetailOrderSubmitEnabled}

  ${otp}                            Clear And Subscribe OTP
  Input Text                        ${formDetailOrderOtp}               ${otp}

  Click Element                     ${formDetailOrderOtpSubmitEnabled}

  Wait Until Element Is Visible     ${formDetailOrderSubmittedScreen}      timeout=${generalTimeout}


