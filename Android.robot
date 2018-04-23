*** Settings ***
Library           AppiumLibrary
Library           RequestsLibrary
Library           XML

*** Test Cases ***
Register
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=6.0    deviceName=192.168.29.101:5555    appPackage=id.co.cicil.staging    appActivity=id.co.cicil.ui.launcher.LauncherActivity
    ${ID}=    set variable    bangkev12+appweb3@gmail.com
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_start
    Wait Until Element Is Visible    id=nav_account    timeout=5s
    Click Element    id=nav_account
    Click Element    id=text_goto
    Comment    ID
    Input Value    id=input_email    ${ID}
    Input Value    id=input_phone    8118185811
    Input Value    id=input_password    1234567A
    Input Value    id=input_verify_password    1234567A
    Swipe    0    0    500    300    400
    Swipe    0    0    500    300    400
    Click Element    id=button_submit
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Ya, Sudah Benar')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Ya, Sudah Benar')]
    Sleep    2s
    Click Element    id=button_resend_otp
    Sleep    2s
    Click Text    Allow    exact_match=True
    Sleep    10s
    Swipe    0    0    400    300    300
    Click Element    id=input_otp
    Swipe    0    0    400    300    300
    Sleep    10s
    Click Element    id=button_submit
    Wait Until Element Is Visible    id=btn_next    timeout=5s
    Click Element    id=btn_next
    ${body}=    Set Variable    {"username":"${ID}","password":"1234567A"}
    Create Session    acceptor    http://api-staging.cicil.co.id/v1
    ${headers}=    Create Dictionary    key=token    key2=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaWNpbCI6IntcImNpXCI6XCJjaV80NVwiLFwiY29cIjpcImY0NDUzZjY5MWQ4YTc5ZGQzNzdhMjQzMTQzNGVmYWYxXCJ9IiwiZXhwIjoxNTIxMDEzMzI2LCJpYXQiOjE1MjEwMDk3MjZ9.yl3RttrPvz1qdKppkaU52OFp9aZR8cR5dsi2UaZoCFU
    ${resp}=    Post Request    acceptor    /ciciluser    data=${body}
    Should Not Contain    ${resp}    Wrong username or password
    ${resp2}=    Get Request    acceptor    /registration/activate_email
    Should Be Equal As Strings    ${resp2.status_code}    200
    sleep    3s
    Click Element    id=button_submit
    Sleep    3s
    Click Element    id=nav_setting
    Sleep    1s
    Swipe    0    0    500    300    300
    sleep    1s
    Swipe    0    0    500    300    300
    Click Element    id=container_logout
    Click Element    id=button1
    Comment    Click Element    id=button_submit
    Comment    Click Element    class=android.widget.Switch
    Comment    Sleep    2s
    Comment    Click Element    class=android.widget.Switch
    Close Application

Login android
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=6.0    deviceName=192.168.29.101:5555    appPackage=id.co.cicil.staging    appActivity=id.co.cicil.ui.launcher.LauncherActivity
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_start
    Sleep    5s
    Wait Until Element Is Visible    id=nav_account    timeout=5s
    Click Element    id=nav_account
    sleep    2s
    Swipe    0    0    500    300    400
    Comment    Click Element    id=text_goto
    ID
    Comment    Input Value    id=input_email    bangkev12+b40@gmail.com
    Comment    Input Value    id=input_password    1234567A
    Click Element    id=button_submit
    Sleep    6s
    ${text button}=    Get Text    id=text_title_suggestion
    BuiltIn.Should Contain    ${text button}    Profilku

isi profile
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=4.4.4    deviceName=192.168.29.101:5555    appPackage=id.co.cicil.staging    appActivity=id.co.cicil.ui.launcher.LauncherActivity
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_start
    Wait Until Element Is Visible    id=nav_account    timeout=5s
    Click Element    id=nav_account
    sleep    2s
    Swipe    0    0    500    300    400
    Comment    Click Element    id=text_goto
    Input Value    id=input_email    bangkev12+cli37@gmail.com
    Input Value    id=input_password    1234567A
    comment    ID
    Comment    Input Value    id=input_email    bangkev12+b40@gmail.com
    Input Value    id=input_password    1234567A
    Click Element    id=button_submit
    Sleep    6s
    ${text button}=    Get Text    id=text_title_suggestion
    BuiltIn.Should Contain    ${text button}    Profilku
    Click Element    id=text_title_suggestion
    Click Element    id=image_photo
    Sleep    12s
    Click Element    id=button2
    Click Text    Download    exact_match=True
    comment    Click Element At Coordinates    542    243
    sleep    2s
    Click Element At Coordinates    0    243
    sleep    1s
    Click Element    id=button_submit
    Click Element At Coordinates    675    1162
    Click Element    id=button2
    Click Element At Coordinates    542    243
    sleep    2s
    Click Element At Coordinates    0    243
    sleep    1s
    Click Element    id=button_submit
    Swipe    0    0    500    300    400
    Input Value    id=input_first_name    juragan
    Input Value    id=input_last_name    bola
    Input Value    id=input_id_card_no    8909878765478658
    Swipe    0    0    900    20    400
    Click Element    id=input_dob
    Click Button    Apr
    Click Button    May
    Click Button    2017
    Click Button    2016
    Click Button    2015
    Click Button    2014
    Click Button    2013
    Click Element    id=button1
    Swipe    0    0    400    20    400
    Click Element    id=button_submit
    Comment    AKADEMIK
    Click Element    id=image_photo
    Click Element    id=button2
    sleep    1s
    Click Element At Coordinates    542    243
    sleep    2s
    Click Element At Coordinates    0    243
    sleep    1s
    Click Element    id=button_submit
    Input Value    id=input_student_no    nyoba123
    Swipe    0    0    500    300    400
    Click Element    id=input_university
    sleep    1s
    Input Value    id=input_suggestion    bandung
    Click Element    id=text_title_suggestion
    sleep    1s
    Click Element    id=input_faculty
    Input Value    id=input_suggestion    teknik sipil
    Click Element    id=text_add_new
    sleep    1s
    Click Element    id=input_city
    Input Value    id=input_suggestion    bandung
    Click Element At Coordinates    0    609
    sleep    1s
    Swipe    0    0    500    300    400
    Click Element    id=input_start_date
    Click Button    Apr
    Click Button    May
    sleep    1s
    Click Button    16
    Click Button    17
    Sleep    1s
    Click Button    2017
    Click Button    2016
    sleep    1s
    Click Element    id=button1
    sleep    1s
    Click Element    id=input_end_date
    sleep    1s
    Click Button    Apr
    Click Button    May
    sleep    1s
    Click Element At Coordinates    432    879
    Sleep    1s
    Click Button    2019
    Click Button    2020
    sleep    2s
    Click Element    id=button1
    sleep    1s
    Click Element    id=switch_first_semester
    Swipe    0    0    850    100    400
    Click Element    id=button_submit
    Comment    ALAMAT TINGGAL
    sleep    2s
    Click Element    id=text_spinner_item
    Swipe    0    0    500    300    400
    sleep    1s
    Click Text    Rumah orang tua    exact_match=True
    Sleep    1s
    Input Value    id=input_address    jalan tikus nomor 1A kemacanan
    sleep    1s
    Click Element    id=input_city
    Input Value    id=input_suggestion    Bandung
    Click Text    KOTA BANDUNG    exact_match=True
    Click Element    id=input_district
    sleep    1s
    Input Value    id=input_suggestion    buah
    Click Text    BUAHBATU    exact_match=True
    Input Value    id=input_postal_code    34521
    sleep    1s
    Swipe    0    0    500    300    400
    Click Element    id=switch_same_address
    sleep    1s
    Swipe    0    0    500    300    400
    Click Element    id=button_submit
    Comment    LATAR BELAKANG ORANG TUA
    sleep    1s
    Input Value    id=input_first_name_1    marinir
    Input Value    id=input_last_name_1    setia
    Click Element    id=input_occupation_1
    sleep    1s
    Click Text    Karyawan Swasta    exact_match=True
    Input Value    id=input_phone_1    812564736222
    sleep    2s
    Swipe    0    0    500    300    400
    sleep    1s
    Input Value    id=input_first_name_2    marisa
    Input Value    id=input_last_name_2    dora
    Click Element    id=input_occupation_2
    Click Text    Wiraswasta    exact_match=True
    sleep    1s
    Swipe    0    0    500    300    400
    Input Value    id=input_phone_2    881237478833
    Click Element    id=button_submit
    Comment    EXTRA
    Click Element    id=button_add_job
    Swipe    0    0    500    200    400
    Input Value    id=input_1    starbang
    Input Value    id=input_2    petekangkopi
    sleep    1s
    Click Element    id=image_photo
    sleep    1s
    Click Element    id=button2
    Click Text    Download    exact_match=True
    Sleep    2s
    Click Element At Coordinates    386    160
    sleep    2s
    Click Element At Coordinates    0    160
    Click Element    id=button_submit

tempat coba
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=6.0    deviceName=192.168.29.101:5555    appPackage=id.co.cicil.staging    appActivity=id.co.cicil.ui.launcher.LauncherActivity
    Sleep    5s
    Click Element    id=nav_account
    sleep    2s
    Swipe    0    0    600    200    400
    Comment    Click Element    id=text_goto
    Comment    ID
    Input Value    id=input_email    bangkev12+app18@gmail.com
    Input Value    id=input_password    1234567A
    Click Element    id=button_submit
    Sleep    6s
    ${text button}=    Get Text    id=text_title_suggestion
    BuiltIn.Should Contain    ${text button}    Profilku
    Click Element    id=text_title_suggestion
    Wait Until Page Contains Element    id=input_student_no    timeout=5s

ubah password
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=4.4.4    deviceName=192.168.29.101:5555    appPackage=id.co.cicil.staging    appActivity=id.co.cicil.ui.launcher.LauncherActivity
    Sleep    5s
    Click Element    id=nav_account
    sleep    2s
    Swipe    0    0    500    300    400
    ID
    Comment    Input Value    id=input_email    bangkev12+b40@gmail.com
    Input Value    id=input_password    1234567A
    Click Element    id=button_submit
    Sleep    6s
    ${text button}=    Get Text    id=text_title_suggestion
    BuiltIn.Should Contain    ${text button}    Profilku
    Click Text    Ubah Password    exact_match=True
    Input Value    id=input_old_password    1234567A
    password baru
    Click Element    id=button_submit

isi profile nougat
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=6.0    deviceName=192.168.29.101:5555    appPackage=id.co.cicil.staging    appActivity=id.co.cicil.ui.launcher.LauncherActivity
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_start
    Sleep    5s
    Wait Until Element Is Visible    id=nav_account    timeout=5s
    Click Element    id=nav_account
    sleep    2s
    Swipe    0    0    600    200    400
    Comment    Click Element    id=text_goto
    Input Value    id=input_email    bangkev12+appweb3@gmail.com
    Input Value    id=input_password    1234567A
    comment    ID
    Comment    Input Value    id=input_email    bangkev12+appweb3@gmail.com
    Click Element    id=button_submit
    Sleep    6s
    ${text button}=    Get Text    id=text_title_suggestion
    BuiltIn.Should Contain    ${text button}    Profilku
    wait until element is visible    id=text_title_suggestion    timeout=5s
    Click Element    id=text_title_suggestion
    sleep    2s
    Click Element    id=image_photo
    Sleep    12s
    Click Element    id=button2
    sleep    2s
    Click Text    Allow    exact_match=True
    sleep    1s
    Click Text    Allow    exact_match=True
    click text    All Photos    exact-match=True
    Comment    Click Element At Coordinates    386    160
    sleep    2s
    Click Element At Coordinates    0    160
    sleep    2s
    Click Element    id=button_submit
    Click Element At Coordinates    486    748
    Click Element    id=button2
    click text    All Photos    exact-match=True
    comment    Click Element At Coordinates    386    160
    sleep    2s
    Click Element At Coordinates    0    160
    sleep    2s
    Click Element    id=button_submit
    Swipe    0    0    600    200    400
    wait until element is visible    id=input_first_name    timeout=5s
    Input Value    id=input_first_name    juragan
    wait until element is visible    id=input_last_name    timeout=5s
    Input Value    id=input_last_name    bola
    KTP
    Swipe    0    0    600    200    400
    Wait Until Element Is Visible    id=input_dob    timeout=5s
    Click Element    id=input_dob
    Click Element    id=date_picker_header_year
    sleep    1s
    Swipe    0    0    400    1000    400
    Swipe    0    0    400    1000    400
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text, '2009')]    timeout=5s
    Swipe    0    0    400    1000    400
    comment    Swipe    0    0    400    1000    400
    Sleep    1s
    Click Text    2003    exact_match=True
    Click Element    id=next
    Click Element    id=next
    Click Text    11    exact_match=True
    Click Element    id=button1
    Swipe    0    0    500    350    400
    comment    Wait Until Element Is Visible    id=rb_male    timeout=5s
    Click Element    id=rb_male
    sleep    1s
    Swipe    0    0    600    200    400
    sleep    2s
    Swipe    0    0    600    200    400
    Click Element    id=button_submit
    Comment    AKADEMIK
    Click Element    id=image_photo
    Click Element    id=button2
    sleep    1s
    Comment    Click Text    Allow    exact_match=True
    sleep    1s
    Comment    Click Text    Allow    exact_match=True
    Sleep    1s
    Click Element At Coordinates    386    160
    sleep    2s
    Click Element At Coordinates    0    160
    sleep    1s
    Click Element    id=button_submit
    wait until element is visible    id=input_student_no    timeout=5s
    Input Value    id=input_student_no    nyoba123
    Swipe    0    0    500    300    400
    Click Element    id=input_university
    wait until element is visible    id=input_suggestion    timeout=5s
    Input Value    id=input_suggestion    bandung
    Click Element    id=text_title_suggestion
    wait until element is visible    id=input_faculty    timeout=5s
    Click Element    id=input_faculty
    Input Value    id=input_suggestion    teknik sipil
    Click Element    id=text_add_new
    wait until element is visible    id=input_city    timeout=5s
    Click Element    id=input_city
    Input Value    id=input_suggestion    bandung
    Click Text    KOTA BANDUNG    exact_match=True
    sleep    1s
    Swipe    0    0    500    300    400
    sleep    1s
    Click Element    id=input_start_date
    sleep    1s
    Click Element    id=date_picker_header_year
    Click Text    2016    exact_match=True
    sleep    1s
    Click Element    id=next
    Click Element    id=next
    Click Element    id=next
    Sleep    1s
    Click Text    20    exact_match=True
    sleep    2s
    Click Element    id=button1
    sleep    1s
    Click Element    id=input_end_date
    sleep    1s
    Click Element    id=date_picker_header_year
    Click Text    2020    exact_match=True
    sleep    1s
    Click Element    id=next
    Click Element    id=next
    Click Element    id=next
    Sleep    1s
    Click Text    20    exact_match=True
    sleep    2s
    Click Element    id=button1
    Click Element    id=switch_first_semester
    Sleep    1s
    Swipe    0    0    600    200    400
    Sleep    2s
    Swipe    0    0    500    300    400
    Sleep    2s
    Swipe    0    0    500    300    400
    wait until element is visible    id=button_submit    timeout=5s
    Click Element    id=button_submit
    Comment    ALAMAT TINGGAL
    sleep    2s
    Click Element    id=text_spinner_item
    Swipe    0    0    500    200    400
    sleep    1s
    Click Text    Rumah orang tua    exact_match=True
    Sleep    1s
    Input Value    id=input_address    jalan tikus nomor 1A kemacanan
    sleep    1s
    Swipe    0    0    500    300    400
    Click Element    id=input_city
    Input Value    id=input_suggestion    Bandung
    Click Text    KOTA BANDUNG    exact_match=True
    Click Element    id=input_district
    sleep    1s
    Input Value    id=input_suggestion    buah
    Click Text    BUAHBATU    exact_match=True
    Input Value    id=input_postal_code    34521
    sleep    1s
    Swipe    0    0    500    300    400
    Click Element    id=switch_same_address
    sleep    1s
    Swipe    0    0    500    300    400
    Click Element    id=button_submit
    Comment    LATAR BELAKANG ORANG TUA
    sleep    1s
    Input Value    id=input_first_name_1    marinir
    Input Value    id=input_last_name_1    setia
    Click Element    id=input_occupation_1
    sleep    1s
    Click Text    Karyawan Swasta    exact_match=True
    Input Value    id=input_phone_1    812564736222
    sleep    2s
    Swipe    0    0    500    300    400
    sleep    1s
    Input Value    id=input_first_name_2    marisa
    Input Value    id=input_last_name_2    dora
    Swipe    0    0    500    400    400
    Click Element    id=input_occupation_2
    Click Text    Wiraswasta    exact_match=True
    sleep    1s
    Swipe    0    0    500    300    400
    Input Value    id=input_phone_2    881237478833
    Click Element    id=button_submit
    Comment    EXTRA
    Click Element    id=button_add_job
    Input Value    id=input_1    starbang
    Input Value    id=input_2    petekangkopi
    Wait Until Element Is Visible    id=image_photo    timeout=5s
    Click Element    id=image_photo
    Wait Until Element Is Visible    id=button2    timeout=5s
    Click Element    id=button2
    click text    All Photos    exact-match=True
    comment    Click Element At Coordinates    386    160
    sleep    2s
    Click Element At Coordinates    0    160
    Wait Until Element Is Visible    id=button_submit    timeout=5s
    Click Element    id=button_submit
    Swipe    0    0    500    200    400
    sleep    1S
    Swipe    0    0    500    300    400
    Sleep    1s
    Swipe    0    0    500    300    400
    sleep    1s
    Swipe    0    0    500    300    400
    Click Element    id=checkbox_agreement
    Click Element    id=button_submit
    Wait Until Element Is Visible    id=button2    timeout=5s
    Click Element    id=button2

order
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=6.0    deviceName=192.168.29.101:5555    appPackage=id.co.cicil.staging    appActivity=id.co.cicil.ui.launcher.LauncherActivity
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_start
    Sleep    5s
    Wait Until Element Is Visible    id=nav_account    timeout=5s
    Click Element    id=nav_account
    sleep    2s
    ID
    Click Element    id=button_submit
    Wait Until Element Is Visible    id=nav_home    timeout=5s
    Click Element    nav_home
    Sleep    2s
    Click Element    id=text_example_url
    Click Element    id=linear_search
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Ajukan Cicilan')]    timeout=5s
    Swipe    0    0    600    200    400
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text, 'Tentukan cicilanmu per bulan')]    timeout=5s
    Clear Text    id=input_dp
    Sleep    1s
    Input Value    id=input_dp    200000
    sleep    2s
    Comment    Click Element    id=text_spinner_item
    Swipe    0    0    600    200    400
    sleep    1s
    Swipe    0    0    600    200    400
    sleep    1s
    Swipe    0    0    600    200    400
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text, 'Contoh: warna hjiau / ukuran M')]    timeout=5s
    Input Value    id=input_note    warna emas
    Click Element    id=button_submit

waiting downpayment
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=6.0    deviceName=192.168.29.101:5555    appPackage=id.co.cicil.staging    appActivity=id.co.cicil.ui.launcher.LauncherActivity
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Allow')]    timeout=5s
    Click Element    xpath=//android.widget.Button[contains(@text, 'Allow')]
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_next
    Click Element    id=btn_start
    Wait Until Element Is Visible    id=nav_account    timeout=5s
    Click Element    id=nav_account
    Sleep    5s
    Swipe    0    0    500    300    400
    Comment    Click Element    id=text_goto
    Comment    ID
    Input Value    id=input_email    bangkev12+ali@gmail.com
    Input Value    id=input_password    1234567A
    Click Element    id=button_submit
    Sleep    6s
    ${text button}=    Get Text    id=text_title_suggestion
    BuiltIn.Should Contain    ${text button}    Profilku
    Click Text    Status Order    exact_match=True
    sleep    1s
    Click Element    id=button_dp
    sleep    2s
    Click Element    id=arrow_expand
    Swipe    0    0    500    300    400
    sleep    1s
    Swipe    0    0    500    300    400
    sleep    1s
    Swipe    0    0    600    100    400
    sleep    2s
    Click Text    Bank BRI Virtual Account    exact_match=True
    Click Element    id=button_submit
    sleep    2s
    ${nomor_va}=    Get Text    xpath=//*[contains(@text,'87')]
    Comment    ${va_number}    Set Variable    ${nomor_va}
    Comment    BuiltIn.Should Contain    ${nomor_va}=    8777810000000405
    ${inquirypayment}=    Create Dictionary    MALLID=4924    CHAINMERCHANT=0    AMOUNT=100000    WORDS=d68265033cdf4cc434f20787e0038ce4f0da4a10    PAYMENTCHANNEL=22
    ...    PAYMENTCODE=${nomor_va}
    Create Session    acceptor    http://api-staging.cicil.co.id/v1
    ${headers}=    Create Dictionary    key=token    Content-Type=application/x-www-form-urlencoded
    ${resppayment}=    Post Request    acceptor    /payment/callback/doku/inquiry    data=${inquirypayment}    headers=${headers}
    ${INQUIRY_RESPONSE}=    Parse Xml    ${resppayment.text}
    ${x}    Get Element    ${INQUIRY_RESPONSE}    TRANSIDMERCHANT
    Log    ${x.text}
    ${notifypayment}    Create Dictionary    MALLID=0    AMOUNT=100000    CHAINMERCHANT=0    TRANSIDMERCHANT=${x.text}    WORDS=737cb3824d3c52be9b5f608b643f3ac0b26694a3
    ...    STATUSTYPE=P    RESPONSECODE=0    APPROVALCODE=102476957    RESULTMSG=SUCCESS    PAYMENTCHANNEL=34    PAYMENTCODE=${nomor_va}
    ...    SESSIONID=session1    BANK=BRI    MCN=${nomor_va}    PAYMENTDATETIME=20171119130851    VERIFYID=0    VERIFYSCORE=-1
    ...    VERIFYSTATUS=NA
    ${headers2}=    Create Dictionary    Content-Type=application/json
    ${resppayment2}    Post Request    acceptor    /payment/callback/doku/notify    data=${notifypayment}    headers=${headers}

coba real device
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=5.1.1    deviceName=d2e9ca19    appPackage=id.co.cicil.staging    appActivity=id.co.cicil.ui.launcher.LauncherActivity
    Sleep    5s
    Click Element    id=nav_account
    sleep    2s
    Swipe    0    0    600    200    400
    Comment    Click Element    id=text_goto
    ID
    Comment    Input Value    id=input_email    bangkev12+b40@gmail.com
    Comment    Input Value    id=input_password    1234567A
    Click Element    id=button_submit
    Sleep    6s
    ${text button}=    Get Text    id=text_title_suggestion
    BuiltIn.Should Contain    ${text button}    Profilku
    Click Element    id=text_title_suggestion
    click element

*** Keywords ***
ID
    Input Value    id=input_email    bangkev12+appweb3@gmail.com
    Input Value    id=input_password    1234567A

password baru
    Input Value    id=input_password    12345678A
    Input Value    id=input_verify_password    12345678A

KTP
    Input Value    id=input_id_card_no    8909878765478456

url
    Input Value    id=input_search    https://www.tokopedia.com/elektroshop123/delonghi-ec-680-bk-dedica-coffee-maker-mesin-kopi-espresso-ec680bk
