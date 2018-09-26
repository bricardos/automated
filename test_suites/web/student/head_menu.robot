*** Variables ***
${generalTimeout}           30s

${buttonHome}               //a[text()="Beranda"]
${buttonAboutUs}            //a[text()="Tentang Kami"]
${buttonHowItWorks}         //a[text()="Cara Kerja"]
${buttonFAQ}                //a[text()="FAQ"]
${buttonAmbassador}         //a[text()="Ambasador"]
${buttonCareer}             //a[text()="Karir"]
${buttonContact}            //a[text()="Kontak"]

*** Keywords ***
Go To Home
  Wait Until Element Is Visible       ${buttonHome}      timeout=${generalTimeout}

  Click Element                       ${buttonHome}

Go To About Us
  Wait Until Element Is Visible       ${buttonAboutUs}      timeout=${generalTimeout}

  Click Element                       ${buttonAboutUs}

Go To How It Works
  Wait Until Element Is Visible       ${buttonHowItWorks}      timeout=${generalTimeout}

  Click Element                       ${buttonHowItWorks}

Go To FAQ
  Wait Until Element Is Visible       ${buttonFAQ}      timeout=${generalTimeout}

  Click Element                       ${buttonFAQ}

Go To Ambassador
  Wait Until Element Is Visible       ${buttonAmbassador}      timeout=${generalTimeout}

  Click Element                       ${buttonAmbassador}

Go To Career
  Wait Until Element Is Visible       ${buttonCareer}      timeout=${generalTimeout}

  Click Element                       ${buttonCareer}

Go To Contact
  Wait Until Element Is Visible       ${buttonContact}      timeout=${generalTimeout}

  Click Element                       ${buttonContact}
