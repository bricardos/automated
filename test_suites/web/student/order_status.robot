*** Settings ***
Library                                     String

Resource                                    ../../helper/converter.robot
*** Variables ***
${generalTimeout}                           30s

${buttonPayDownPayment}                     //button[text()="Bayar Uang Muka"]

${selectBankBRI}                            //cicil-panel-select//p[contains(text(), "Bank BRI Virtual Account")]

${panelPaymentDetail}                       //h5/strong[contains(text(), "Detil pembayaran")]

${panelPaymentDetailInfo}                   ${panelPaymentDetail}/ancestor::cicil-panel//span[text()="Uang Muka"]/parent::div
${panelPaymentDetailNominal}                ${panelPaymentDetailInfo}/following-sibling::div/span

${buttonPayNow}                             //button[text()="Bayar Sekarang"]

${panelPaymentGuide}                        //h4[text()="Petunjuk Pembayaran"]
${textVirtualAccountNo}                     //cicil-panel//div[contains(@class, "text-right")]/span


*** Keywords ***
Pay Down Payment By Order
  [Arguments]   ${order}

  ${buttonAction}       Set Variable      //h5[contains(text(), "${order}")]/ancestor::cicil-panel${buttonPayDownPayment}

  Wait Until Element Is Visible           ${buttonAction}      timeout=${generalTimeout}

  Click Element                           ${buttonAction}

  Wait Until Element Is Visible           ${selectBankBRI}      timeout=${generalTimeout}

  Click Element                           ${selectBankBRI}

  Wait Until Element Is Visible           ${panelPaymentDetailNominal}      timeout=${generalTimeout}

  ${amount}                               Get Text                          ${panelPaymentDetailNominal}

  ${amount}                               Convert Currency To Integer       ${amount}

  Click Element                           ${buttonPayNow}

  Wait Until Element Is Visible           ${panelPaymentGuide}      timeout=${generalTimeout}

  ${virtualAccount}                       Get Text                          ${textVirtualAccountNo}

  [Return]    ${amount}     ${virtualAccount}



