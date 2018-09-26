*** Variables ***
${generalTimeout}                   30s

${documentVerification}             //admin-verification-doc-list
${documentVerificationStatus}       ${documentVerification}//ul[@class="stat"]

${groupTableVerification}           //admin_table_serverside
${formSearch}                       ${groupTableVerification}//ssd_search
${formSearchCategory}               ${formSearch}//select
${formSearchCriteria}               ${formSearch}//input[@placeholder="search"]

${tableVerification}                ${groupTableVerification}//table

${buttonStartVerify}                //button/*[text()="Mulai Verifikasi" or text()="Lanjutkan Verifikasi"]

${wizardVerification}               //div[@class="answers_box"]
${wizardVerificationQuestion}       ${wizardVerification}//div[@class="question"]
${wizardVerificationNextEnabled}    ${wizardVerification}//button[contains(text(), "Next") and not(@disabled)]

${resultVerification}               //h3[text()="Verification Results"]

*** Keywords ***
Select From Verification List By Email
  [Arguments]   ${email}

  ${selectedRow}    Set Variable            ${tableVerification}//td//*[contains(text(), "${email}")]
  Wait Until Element Is Visible             ${selectedRow}      timeout=${generalTimeout}

  Click Element                             ${selectedRow}

Search Verification List By Email
  [Arguments]   ${email}    ${status}
  ${buttonStatus}   Set Variable            ${documentVerificationStatus}//p[contains(text(), "${status}")]

  Wait Until Element Is Visible             ${buttonStatus}      timeout=${generalTimeout}

  Click Element                             ${buttonStatus}

  Wait Until Element Is Visible             ${formSearch}      timeout=${generalTimeout}

  Select From List By Label                 ${formSearchCategory}               Email
  Input Text                                ${formSearchCriteria}               ${email}

Start Verification Process
  Wait Until Element Is Visible             ${buttonStartVerify}      timeout=${generalTimeout}

  Click Element                             ${buttonStartVerify}

Answer Verification
  [Arguments]   ${question}   ${answer}
  Wait Until Element Is Visible             ${wizardVerificationQuestion}//label[contains(text(), "${question}")]      timeout=${generalTimeout}

  ${buttonAnswer}   Set Variable            ${wizardVerificationQuestion}//input[@value="yes"]/parent::label

  Wait Until Element Is Visible             ${buttonAnswer}      timeout=${generalTimeout}

  Click Element                             ${buttonAnswer}

  Wait Until Element Is Visible             ${wizardVerificationNextEnabled}      timeout=${generalTimeout}

  Click Element                             ${wizardVerificationNextEnabled}

Complete Data Verification
  [Arguments]   ${action}
  Wait Until Element Is Visible             ${resultVerification}      timeout=${generalTimeout}

  ${buttonAction}   Set Variable            //button[contains(text(), "${action}")]

  Wait Until Element Is Visible             ${buttonAction}      timeout=${generalTimeout}

  Click Element With Javascript             ${buttonAction}


