*** Settings ***
Library           DateTime
Library           FakerLibrary
Resource          ../../helper/date_picker_selector.robot
Resource          ../../helper/dropdown_selector.robot
Resource          ../../helper/javascript_action.robot
Resource          my_account.robot
Resource          notification.robot

*** Variables ***
${generalTimeout}    30s
${formPersonalProfile}    //span[text()="Data Pribadi"]
${formPersonalProfileGroup}    ${formPersonalProfile}/ancestor::cicil-accordion-header/following-sibling::*
${formPersonalProfileExpandend}    ${formPersonalProfile}/ancestor::*[contains(@class, "accordion_header_container expanded")]
${formPersonalProfileFirstname}    ${formPersonalProfileGroup}//input[@id="firstname"]
${formPersonalProfileLastname}    ${formPersonalProfileGroup}//input[@id="lastname"]
${formPersonalProfileBirthDate}    ${formPersonalProfileGroup}//label[contains(text(), "Tanggal Lahir")]/parent::cicil-form-label/following-sibling::div//button
${formPersonalProfileGender}    ${formPersonalProfileGroup}//label[text()="Pria"]
${formPersonalProfileWaId}    ${formPersonalProfileGroup}//input[@id="wa_id"]
${formPersonalProfileLineId}    ${formPersonalProfileGroup}//input[@id="line_id"]
${formPersonalProfileIdCardNo}    ${formPersonalProfileGroup}//input[@id="id_card_no"]
${formPersonalProfileKtpFile}    ${formPersonalProfileGroup}//label[contains(text(), "Kartu Identitas (KTP)")]/ancestor::cicil-form-image-uploader//input[@type="file"]
${formPersonalProfileSelfieKtpFile}    ${formPersonalProfileGroup}//label[contains(text(), "Foto Selfie + KTP")]/ancestor::cicil-form-image-uploader//input[@type="file"]
${formPersonalProfileSubmitEnabled}    ${formPersonalProfileGroup}//button[text()="Simpan Perubahan Data" and not(@disabled)]
${formAcademicProfile}    //span[text()="Data Akademik"]
${formAcademicProfileGroup}    ${formAcademicProfile}/ancestor::cicil-accordion-header/following-sibling::*
${formAcademicProfileExpandend}    ${formAcademicProfile}/ancestor::*[contains(@class, "accordion_header_container expanded")]
${formAcademicProfileStudentStatus}    ${formAcademicProfileGroup}//label[contains(text(), "Status Kemahasiswaan")]/parent::*/following-sibling::*//ng-select
${formAcademicProfileProgram}    ${formAcademicProfileGroup}//label[contains(text(), "Program")]/parent::*/following-sibling::*//ng-select
${formAcademicProfileCity}    ${formAcademicProfileGroup}//label[contains(text(), "Kota")]/parent::*/following-sibling::*//ng-select
${formAcademicProfileUniversity}    ${formAcademicProfileGroup}//input[@id="university"]
${formAcademicProfileFaculty}    ${formAcademicProfileGroup}//input[@id="faculty"]
${formAcademicProfileMajor}    ${formAcademicProfileGroup}//input[@id="major"]
${formAcademicProfileStartMonth}    ${formAcademicProfileGroup}//label[contains(text(), "Bulan Mulai Kuliah")]/parent::*/following-sibling::*//ng-select
${formAcademicProfileStartYear}    ${formAcademicProfileGroup}//input[@id="start_year"]
${formAcademicProfileEndMonth}    ${formAcademicProfileGroup}//label[contains(text(), "Perkiraan Bulan Kelulusan")]/parent::*/following-sibling::*//ng-select
${formAcademicProfileEndYear}    ${formAcademicProfileGroup}//input[@id="end_year"]
${formAcademicProfileGpa}    ${formAcademicProfileGroup}//input[@id="gpa"]
${formAcademicProfileStudentNo}    ${formAcademicProfileGroup}//input[@id="student_no"]
${formAcademicProfileStudentCardFile}    ${formAcademicProfileGroup}//label[contains(text(), "Kartu Mahasiswa")]/ancestor::cicil-form-image-uploader//input[@type="file"]
${formAcademicProfileSubmitEnabled}    ${formAcademicProfileGroup}//button[text()="Simpan Perubahan Data" and not(@disabled)]
${formAddressProfile}    //span[text()="Alamat & Kontak Detail"]
${formAddressProfileGroup}    ${formAddressProfile}/ancestor::cicil-accordion-header/following-sibling::*
${formAddressProfileExpanded}    ${formAddressProfile}/ancestor::*[contains(@class, "accordion_header_container expanded")]
${formAddressProfileFixAddress}    ${formAddressProfileGroup}//input[@id="fix_address"]
${formAddressProfileFixAddressType}    ${formAddressProfileGroup}//label[@for="fix_address_type"]/parent::*/following-sibling::*//ng-select
${formAddressProfileFixCity}    ${formAddressProfileGroup}//label[@for="address_fix_city"]/parent::*/following-sibling::*//ng-select
${formAddressProfileFixDistrict}    ${formAddressProfileGroup}//label[@for="address_fix_district"]/parent::*/following-sibling::*//ng-select
${formAddressProfileFixPostalCode}    ${formAddressProfileGroup}//input[@id="fix_postal_code"]
${formAddressProfileSameAddress}    ${formAddressProfileGroup}//input[@id="same_address"]
${formAddressProfileAddress}    ${formAddressProfileGroup}//input[@id="address"]
${formAddressProfileAddressType}    ${formAddressProfileGroup}//label[@for="address_type"]/parent::*/following-sibling::*//ng-select
${formAddressProfileCity}    ${formAddressProfileGroup}//label[@for="address_city"]/parent::*/following-sibling::*//ng-select
${formAddressProfileDistrict}    ${formAddressProfileGroup}//label[@for="address_district"]/parent::*/following-sibling::*//ng-select
${formAddressProfilePostalCode}    ${formAddressProfileGroup}//input[@id="postal_code"]
${formAddressProfileSubmitEnabled}    ${formAddressProfileGroup}//button[text()="Simpan Perubahan Data" and not(@disabled)]
${formGuardianProfile}    //span[text()="Latar Belakang Orang Tua"]
${formGuardianProfileGroup}    ${formGuardianProfile}/ancestor::cicil-accordion-header/following-sibling::*
${formGuardianProfileExpanded}    ${formGuardianProfile}/ancestor::*[contains(@class, "accordion_header_container expanded")]
${formGuardianProfileFirstName1}    ${formGuardianProfileGroup}//input[@id="firstname_guardian"]
${formGuardianProfileLastName1}    ${formGuardianProfileGroup}//input[@id="lastname_guardian"]
${formGuardianProfileOccupation1}    ${formGuardianProfileGroup}//label[@for="occupation_guardian"]/parent::*/following-sibling::*//ng-select
${formGuardianProfilePhone1}    ${formGuardianProfileGroup}//input[@id="phone_guardian"]
${formGuardianProfileFirstName2}    ${formGuardianProfileGroup}//input[@id="firstname_guardian_2"]
${formGuardianProfileLastName2}    ${formGuardianProfileGroup}//input[@id="lastname_guardian_2"]
${formGuardianProfileOccupation2}    ${formGuardianProfileGroup}//label[@for="occupation_guardian_2"]/parent::*/following-sibling::*//ng-select
${formGuardianProfilePhone2}    ${formGuardianProfileGroup}//input[@id="phone_guardian_2"]
${formGuardianProfileSubmitEnabled}    ${formGuardianProfileGroup}//button[text()="Simpan Perubahan Data" and not(@disabled)]
${formProfileAgreement}    //label[@for="agree"]
# For the sake of consistency
${formProfileAgreementGroup}    ${formProfileAgreement}/ancestor::cicil-panel
${formProfileAgreementSubmitEnabled}    ${formProfileAgreementGroup}//button[text()="LANJUT" and not(@disabled)]
${formProfileAgreementSubmitScreen}    //h4[contains(text(), "Terima kasih sudah mendaftarkan profil kamu")]

*** Keywords ***
Initialize Personal Profile Data
    ${firstName}    FakerLibrary.FirstName
    ${lastName}    FakerLibrary.LastName
    ${birthDate}    FakerLibrary.Date Time Between    start_date=-24y    end_date=-17y
    ${waId}    Set Variable    ${EMPTY}
    ${lineId}    Set Variable    ${EMPTY}
    ${idCardNo}    FakerLibrary.Numerify    text=%%%%%%%%%%%%%%%%
    ${ktpFile}    Set Variable    /Users/cicil/Documents/e-ktp.jpg
    ${selfieKtpFile}    Set Variable    /Users/cicil/Documents/e-ktp.jpg
    Set Test Variable    ${personalProfileFirstName}    ${firstName}
    Set Test Variable    ${personalProfileLastName}    ${lastName}
    Set Test Variable    ${personalProfileBirthDate}    ${birthDate}
    Set Test Variable    ${personalProfileWaId}    ${waId}
    Set Test Variable    ${personalProfileLineId}    ${lineId}
    Set Test Variable    ${personalProfileIdCardNo}    ${idCardNo}
    Set Test Variable    ${personalProfileKtpFile}    ${ktpFile}
    Set Test Variable    ${personalProfileSelfieKtpFile}    ${selfieKtpFile}

Initialize Academic Profile Data
    ${studentStatus}    FakerLibrary.Random Element    ['Mahasiswa Aktif']
    ${program}    FakerLibrary.Random Element    ['S1', 'S2', 'S3']
    ${city}    FakerLibrary.Random Element    ['KOTA DEPOK', 'KOTA BANDUNG', 'KOTA JAKARTA BARAT']
    ${university}    FakerLibrary.Random Element    ['Gunadarma1', 'Universitas Bandung', 'Binus Anggrek']
    ${faculty}    FakerLibrary.Random Element    ['Teknik Industri', 'Ilmu Komputer', 'Manajemen']
    ${major}    FakerLibrary.Random Element    ['Teknik Informatika', 'Sistem Informasi', 'Manajemen Bisnis']
    ${startMonth}    FakerLibrary.Random Element    ['Januari', 'Februari', 'Maret']
    ${startYear}    FakerLibrary.Random Element    ['2015', '2016', '2017', '2018']
    ${endMonth}    FakerLibrary.Random Element    ['Januari', 'Februari', 'Maret']
    ${endYear}    FakerLibrary.Random Element    ['2019', '2020', '2021', '2022']
    ${gpa}    FakerLibrary.Random Element    ['2', '3', '4']
    ${studentNo}    FakerLibrary.Numerify    text=%%%%%%%%%%%%%%%%
    ${studentCardFile}    Set Variable    /Users/cicil/Documents/e-ktp.jpg
    Set Test Variable    ${academicProfileStudentStatus}    ${studentStatus}
    Set Test Variable    ${academicProfileProgram}    ${program}
    Set Test Variable    ${academicProfileCity}    ${city}
    Set Test Variable    ${academicProfileUniversity}    ${university}
    Set Test Variable    ${academicProfileFaculty}    ${faculty}
    Set Test Variable    ${academicProfileMajor}    ${major}
    Set Test Variable    ${academicProfileStartMonth}    ${startMonth}
    Set Test Variable    ${academicProfileStartYear}    ${startYear}
    Set Test Variable    ${academicProfileEndMonth}    ${endMonth}
    Set Test Variable    ${academicProfileEndYear}    ${endYear}
    Set Test Variable    ${academicProfileGpa}    ${gpa}
    Set Test Variable    ${academicProfileStudentNo}    ${studentNo}
    Set Test Variable    ${academicProfileStudentCardFile}    ${studentCardFile}

Initialize Address Profile Data
    ${address}    FakerLibrary.Address
    ${addressType}    FakerLibrary.Random Element    ['Apartemen', 'Asrama', 'Kontrakan', 'Kost', 'Ruko', 'Rumah orang tua', 'Rumah saudara']
    ${city}    FakerLibrary.Random Element    ['KOTA DEPOK', 'KOTA BANDUNG', 'KOTA JAKARTA BARAT']
    ${district}    FakerLibrary.Random Element    ['A', 'B']
    ${postalCode}    FakerLibrary.Numerify    text=%%%%%
    Set Test Variable    ${addressProfileAddress}    ${address}
    Set Test Variable    ${addressProfileAddressType}    ${addressType}
    Set Test Variable    ${addressProfileCity}    ${city}
    Set Test Variable    ${addressProfileDistrict}    ${district}
    Set Test Variable    ${addressProfilePostalCode}    ${postalCode}

Initialize Guardian Profile Data
    ${firstName}    FakerLibrary.FirstName
    ${lastName}    FakerLibrary.LastName
    ${occupation}    FakerLibrary.Random Element    ['Seniman', 'Wiraswasta', 'Akademis']
    ${phone}    FakerLibrary.Numerify    text=081%%%%%%%%%
    Set Test Variable    ${guardianProfileFirstName}    ${firstName}
    Set Test Variable    ${guardianProfileLastName}    ${lastName}
    Set Test Variable    ${guardianProfileOccupation}    ${occupation}
    Set Test Variable    ${guardianProfilePhone}    ${phone}

Initialize All Profile Data
    Initialize Personal Profile Data
    Initialize Academic Profile Data
    Initialize Address Profile Data
    Initialize Guardian Profile Data

Fill In Personal Profile
    Wait Until Page Contains Element    ${formPersonalProfile}    timeout=10s
    Scroll To Xpath    ${formPersonalProfile}
    ${expanded}=    Get Element Count    ${formPersonalProfileExpandend}
    Run Keyword If    ${expanded} < 1    Click Element With Javascript    ${formPersonalProfile}
    Wait Until Element Is Visible    ${formPersonalProfileGroup}    timeout=${generalTimeout}
    Input Text    ${formPersonalProfileFirstname}    ${personalProfileFirstName}
    Input Text    ${formPersonalProfileLastname}    ${personalProfileLastName}
    Input Text    ${formPersonalProfileWaId}    ${personalProfileWaId}
    Input Text    ${formPersonalProfileLineId}    ${personalProfileLineId}
    Input Text    ${formPersonalProfileIdCardNo}    ${personalProfileIdCardNo}
    Click Element    ${formPersonalProfileBirthDate}
    Pick A Date From Date Picker    ${personalProfileBirthDate.year.__str__()}    ${personalProfileBirthDate.month.__str__()}    ${personalProfileBirthDate.day.__str__()}
    Click Element    ${formPersonalProfileGender}
    Choose File    ${formPersonalProfileKtpFile}    ${personalProfileKtpFile}
    Choose File    ${formPersonalProfileSelfieKtpFile}    ${personalProfileSelfieKtpFile}
    Wait Until Element Is Visible    ${formPersonalProfileSubmitEnabled}    timeout=${generalTimeout}
    Scroll To Xpath    ${formPersonalProfileSubmitEnabled}
    Click Element With Javascript    ${formPersonalProfileSubmitEnabled}
    Wait Until Notification Is Shown    text="Data berhasil dikirim"

Fill In Academic Profile
    Wait Until Page Contains Element    ${formAcademicProfile}    timeout=10s
    Scroll To Xpath    ${formAcademicProfile}
    ${expanded}=    Get Element Count    ${formAcademicProfileExpandend}
    Run Keyword If    ${expanded} < 1    Click Element With Javascript    ${formAcademicProfile}
    Wait Until Element Is Visible    ${formAcademicProfileGroup}    timeout=${generalTimeout}
    Click Element With Javascript    ${formAcademicProfileStudentStatus}//div[contains(@class, "toggle")]
    Select A Single Value From Dropdown    ${formAcademicProfileStudentStatus}    ${academicProfileStudentStatus}
    Click Element With Javascript    ${formAcademicProfileProgram}//div[contains(@class, "toggle")]
    Select A Single Value From Dropdown    ${formAcademicProfileProgram}    ${academicProfileProgram}
    Click Element With Javascript    ${formAcademicProfileCity}//div[contains(@class, "toggle")]
    Select A Single Value From Dropdown    ${formAcademicProfileCity}    ${academicProfileCity}
    Input Text    ${formAcademicProfileFaculty}    ${academicProfileFaculty}
    Input Text    ${formAcademicProfileMajor}    ${academicProfileMajor}
    Select Non Searchable Dropdown    ${formAcademicProfileUniversity}    ${academicProfileUniversity}
    Click Element With Javascript    ${formAcademicProfileStartMonth}//div[contains(@class, "toggle")]
    Select A Single Value From Dropdown    ${formAcademicProfileStartMonth}    ${academicProfileStartMonth}
    Input Text    ${formAcademicProfileStartYear}    ${academicProfileStartYear}
    Click Element With Javascript    ${formAcademicProfileEndMonth}//div[contains(@class, "toggle")]
    Select A Single Value From Dropdown    ${formAcademicProfileEndMonth}    ${academicProfileEndMonth}
    Input Text    ${formAcademicProfileEndYear}    ${academicProfileEndYear}
    Input Text    ${formAcademicProfileGpa}    ${academicProfileGpa}
    Input Text    ${formAcademicProfileStudentNo}    ${academicProfileStudentNo}
    Choose File    ${formAcademicProfileStudentCardFile}    ${academicProfileStudentCardFile}
    Wait Until Element Is Visible    ${formAcademicProfileSubmitEnabled}    timeout=${generalTimeout}
    Scroll To Xpath    ${formAcademicProfileSubmitEnabled}
    Click Element    ${formAcademicProfileSubmitEnabled}
    Wait Until Notification Is Shown    text="Data berhasil dikirim"

Fill In Address Profile
    Wait Until Page Contains Element    ${formAddressProfile}    timeout=10s
    Scroll To Xpath    ${formAddressProfile}
    ${expanded}=    Get Element Count    ${formAddressProfileExpanded}
    Run Keyword If    ${expanded} < 1    Click Element With Javascript    ${formAddressProfile}
    Wait Until Element Is Visible    ${formAddressProfileGroup}    timeout=${generalTimeout}
    Input Text    ${formAddressProfileFixAddress}    ${addressProfileAddress}
    Click Element With Javascript    ${formAddressProfileFixAddressType}//div[contains(@class, "toggle")]
    Select A Single Value From Dropdown    ${formAddressProfileFixAddressType}    ${addressProfileAddressType}
    # Try to reset to cascading generation of district
    Click Element With Javascript    ${formAddressProfileFixCity}//div[contains(@class, "toggle")]
    Wait Until Keyword Succeeds    1x    200ms    Select A Single Value From Dropdown    ${formAddressProfileFixCity}    KOTA A
    Click Element With Javascript    ${formAddressProfileFixCity}//div[contains(@class, "toggle")]
    Wait Until Keyword Succeeds    1x    200ms    Select A Single Value From Dropdown    ${formAddressProfileFixCity}    ${addressProfileCity}
    Click Element With Javascript    ${formAddressProfileFixDistrict}//div[contains(@class, "toggle")]
    Select A Single Value From Dropdown    ${formAddressProfileFixDistrict}    ${addressProfileDistrict}
    Input Text    ${formAddressProfileFixPostalCode}    ${addressProfilePostalCode}
    Initialize Address Profile Data
    Scroll To Xpath    ${formAddressProfileSameAddress}
    Input Text    ${formAddressProfileAddress}    ${addressProfileAddress}
    Click Element With Javascript    ${formAddressProfileAddressType}//div[contains(@class, "toggle")]
    Select A Single Value From Dropdown    ${formAddressProfileAddressType}    ${addressProfileAddressType}
    # Try to reset to cascading generation of district
    Click Element With Javascript    ${formAddressProfileCity}//div[contains(@class, "toggle")]
    Wait Until Keyword Succeeds    1x    200ms    Select A Single Value From Dropdown    ${formAddressProfileCity}    KOTA A
    Click Element With Javascript    ${formAddressProfileCity}//div[contains(@class, "toggle")]
    Wait Until Keyword Succeeds    1x    200ms    Select A Single Value From Dropdown    ${formAddressProfileCity}    ${addressProfileCity}
    Click Element With Javascript    ${formAddressProfileDistrict}//div[contains(@class, "toggle")]
    Select A Single Value From Dropdown    ${formAddressProfileDistrict}    ${addressProfileDistrict}
    Input Text    ${formAddressProfilePostalCode}    ${addressProfilePostalCode}
    Wait Until Element Is Visible    ${formAddressProfileSubmitEnabled}    timeout=${generalTimeout}
    Scroll To Xpath    ${formAddressProfileSubmitEnabled}
    Click Element    ${formAddressProfileSubmitEnabled}
    Wait Until Notification Is Shown    text="Data berhasil dikirim"

Fill In Guardian Profile
    Wait Until Page Contains Element    ${formGuardianProfile}    timeout=10s
    Scroll To Xpath    ${formGuardianProfile}
    ${expanded}=    Get Element Count    ${formGuardianProfileExpanded}
    Run Keyword If    ${expanded} < 1    Click Element With Javascript    ${formGuardianProfile}
    Wait Until Element Is Visible    ${formGuardianProfileGroup}    timeout=${generalTimeout}
    Input Text    ${formGuardianProfileFirstName1}    ${guardianProfileFirstName}
    Input Text    ${formGuardianProfileLastName1}    ${guardianProfileLastName}
    Input Text    ${formGuardianProfilePhone1}    ${guardianProfilePhone}
    Click Element With Javascript    ${formGuardianProfileOccupation1}//div[contains(@class, "toggle")]
    Select A Single Value From Dropdown    ${formGuardianProfileOccupation1}    ${guardianProfileOccupation}
    Initialize Guardian Profile Data
    Input Text    ${formGuardianProfileFirstName2}    ${guardianProfileFirstName}
    Input Text    ${formGuardianProfileLastName2}    ${guardianProfileLastName}
    Input Text    ${formGuardianProfilePhone2}    ${guardianProfilePhone}
    Click Element With Javascript    ${formGuardianProfileOccupation2}//div[contains(@class, "toggle")]
    Select A Single Value From Dropdown    ${formGuardianProfileOccupation2}    ${guardianProfileOccupation}
    Wait Until Element Is Visible    ${formGuardianProfileSubmitEnabled}    timeout=${generalTimeout}
    Scroll To Xpath    ${formGuardianProfileSubmitEnabled}
    Click Element    ${formGuardianProfileSubmitEnabled}
    Wait Until Notification Is Shown    text="Data berhasil dikirim"

Accept Profile Agreement
    Wait Until Page Contains Element    ${formProfileAgreement}    timeout=10s
    Scroll To Xpath    ${formProfileAgreement}
    Click Element With Javascript    ${formProfileAgreement}
    Wait Until Element Is Visible    ${formProfileAgreementSubmitEnabled}    timeout=${generalTimeout}
    Scroll To Xpath    ${formProfileAgreementSubmitEnabled}
    Click Element    ${formProfileAgreementSubmitEnabled}
    Wait Until Page Contains Element    ${formProfileAgreementSubmitScreen}
    # Fill In Job Profile
    # FIll In Asset Profile
