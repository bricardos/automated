*** Settings ***
Library           AppiumLibrary
Library           RequestsLibrary
Library           XML
Resource          ../global-keyword/global.txt
Library           HttpLibrary.HTTP
Resource          ../global-keyword/Admin.txt
Library           Selenium2Library

*** Variables ***
${ID}             testing+jessica887@cicil.co.id
${ID_ambassador}    amb5@mailinator.com
${orderno}        ORD180823-156774
${useCapitalOKButton}    1

*** Test Cases ***
Register
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=7.1    deviceName=192.168.56.101:5555    appPackage=id.co.cicil.staging    appActivity=id.co.cicil.ui.launcher.LauncherActivity
    ${email}=    generate email
    ${no_hp}=    generate handphone
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    Comment    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.Button
    AppiumLibrary.Click Element    //*[contains(@text,"Lanjut")]
    Comment    Click Element    id=btn_next
    AppiumLibrary.Click Element    //*[contains(@text,"Lanjut")]
    AppiumLibrary.Click Element    //*[contains(@text,"Lanjut")]
    AppiumLibrary.Click Element    //*[contains(@text,"Lanjut")]
    Comment    Click Element    id=btn_start
    AppiumLibrary.Wait Until Element Is Visible    //*[contains(@text,"Cek Sekarang")]    timeout=5s
    AppiumLibrary.Click Element    //*[contains(@text,"Cek Sekarang")]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.FrameLayout[contains(@resource-id,'id.co.cicil.staging:id/nav_account')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.FrameLayout[contains(@resource-id,'id.co.cicil.staging:id/nav_account')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,"Belum punya akun CICIL? Daftar disini")]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,"Belum punya akun CICIL? Daftar disini")]
    AppiumLibrary.Wait Until Element Is Visible    id=input_email    timeout=5s
    Input Value    id=input_email    ${email}
    Set Global Variable    ${email}
    AppiumLibrary.Wait Until Element Is Visible    //*[contains(@text,'+62')]    timeout=5s
    Input Value    //*[contains(@text,'+62')]    ${no_hp}
    ${no_hp}=    Catenate    +62${no_hp}
    Set Global Variable    ${no_hp}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_password')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_password')]    ${pwd}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_verify_password')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_verify_password')]    ${pwd}
    Comment    Swipe    0    0    500    300    400
    Comment    Swipe    0    0    500    300    400
    cari element by swipe    //android.widget.Button[contains(@text,'Daftar')]    0    0    500    300
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Daftar')]    timeout=10s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'Daftar')]
    AppiumLibrary.Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text, 'Ya, Sudah Benar')]    timeout=10s
    AppiumLibrary.Click Element    xpath=//android.widget.Button[contains(@text, 'Ya, Sudah Benar')]
    Sleep    2s
    Sleep    30s
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_otp')]    timeout=10s
    AppiumLibrary.Click Element    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_otp')]
    cari element by swipe    //android.widget.Button[contains(@text,'Lanjut')]    0    0    400    300
    Sleep    15s
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Lanjut')]    timeout=10s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'Lanjut')]
    AppiumLibrary.Wait Until Element Is Visible    id=btn_next    timeout=20s
    AppiumLibrary.Click Element    id=btn_next
    ${body}=    Set Variable    {"username":"${email}","password":"${pwd}"}
    Create Session    acceptor    http://api-staging.cicil.co.id/v1
    ${headers}=    Create Dictionary    key=token    key2=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaWNpbCI6IntcImNpXCI6XCJjaV80NVwiLFwiY29cIjpcImY0NDUzZjY5MWQ4YTc5ZGQzNzdhMjQzMTQzNGVmYWYxXCJ9IiwiZXhwIjoxNTIxMDEzMzI2LCJpYXQiOjE1MjEwMDk3MjZ9.yl3RttrPvz1qdKppkaU52OFp9aZR8cR5dsi2UaZoCFU
    ${resp}=    Post Request    acceptor    /ciciluser    data=${body}
    Should Not Contain    ${resp}    Wrong username or password
    ${resp2}=    Get Request    acceptor    /registration/activate_email
    Should Be Equal As Strings    ${resp2.status_code}    200
    sleep    3s
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Saya Sudah Aktivasi')]
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'Saya Sudah Aktivasi')]
    Sleep    3s
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Profile')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/expanded_menu')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'PENGATURAN')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'PENGATURAN')]
    cari element by swipe    //android.widget.TextView[contains(@text,'Logout')]    0    0    500    300
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Logout')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'Logout')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'YA')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'YA')]
    Close Application

Login android
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=7.1    deviceName=192.168.56.101:5555    appPackage=id.co.cicil.staging    appActivity=id.co.cicil.ui.launcher.LauncherActivity
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]    timeout=${timeout_general}
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]    timeout=${timeout_general}
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]    timeout=${timeout_general}
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Click Element    //*[contains(@text,"Lanjut")]
    AppiumLibrary.Click Element    //*[contains(@text,"Lanjut")]
    AppiumLibrary.Click Element    //*[contains(@text,"Lanjut")]
    AppiumLibrary.Click Element    //*[contains(@text,"Lanjut")]
    Comment    Click Element    id=btn_start
    AppiumLibrary.Wait Until Element Is Visible    //*[contains(@text,"Cek Sekarang")]    timeout=5s
    AppiumLibrary.Click Element    //*[contains(@text,"Cek Sekarang")]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.FrameLayout[contains(@resource-id,'id.co.cicil.staging:id/nav_account')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.FrameLayout[contains(@resource-id,'id.co.cicil.staging:id/nav_account')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_email')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_email')]    ${email}
    Comment    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_email')]    ${ID}
    Comment    Set Global Variable    ${ID}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_password')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_password')]    ${pwd}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Masuk')]
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'Masuk')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Profile')]    timeout=20s
    Comment    ${text button}=    Get Text    id=text_title_suggestion
    Comment    BuiltIn.Should Contain    ${text button}    Profilku

isi profile
    ${first_name}=    FakerLibrary.First Name
    ${last_name}=    FakerLibrary.Last Name
    ${first_name_parent1}=    FakerLibrary.First Name Female
    ${last_name_parent1}=    FakerLibrary.Last Name Female
    ${first_name_parent2}=    FakerLibrary.First Name Male
    ${last_name_parent2}=    FakerLibrary.Last Name Male
    ${no_ktp}=    generate ktp
    ${no_ktm}=    FakerLibrary.Numerify    text=%%%%
    ${city_address1}=    Set Variable    KOTA BANDUNG
    ${city_address2}=    Set Variable    KOTA BANDAR LAMPUNG
    ${faculty}=    Set Variable    TEKNIK SIPIL
    ${university}=    Set Variable    Universitas Bandung
    ${address1}=    FakerLibrary.Address
    ${address2}    FakerLibrary.Address
    ${tipe_address1}=    Set Variable    Kost
    ${tipe_address2}=    Set Variable    Asrama
    ${city_university}=    Set Variable    KOTA BANDUNG
    ${district_address1}=    Set Variable    ANTAPANI
    ${district_address2}=    Set Variable    WAY HALIM
    ${postal_code1}=    FakerLibrary.Numerify    text=%%%%%
    ${postal_code2}=    FakerLibrary.Numerify    text=%%%%%
    ${no_hp_parent1}=    generate handphone
    ${no_hp_parent2}=    generate handphone
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Profile')]    timeout=${timeout_general}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Profilku')]    timeout=${timeout_general}
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'Profilku')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageView[contains(@instance,'0')]    timeout=${timeout_general}
    AppiumLibrary.Click Element    //android.widget.ImageView[contains(@instance,'0')]
    Sleep    15s
    Comment    s    //android.widget.Button[contains(@text,'OKAY')]    timeout=6s
    Comment    Click Element    //android.widget.Button[contains(@text,'Okay')]
    klik okay
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]    timeout=10s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'GALLERY')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'GALLERY')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.RelativeLayout[contains(@instance,'1')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.RelativeLayout[contains(@instance,'1')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Gunakan Foto Ini')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'Gunakan Foto Ini')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageView[contains(@instance,'1')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.ImageView[contains(@instance,'1')]
    comment    Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Okay')]    timeout=6s
    comment    Click Element    //android.widget.Button[contains(@text,'Okay')]
    klik okay
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'GALLERY')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'GALLERY')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.RelativeLayout[contains(@instance,'1')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.RelativeLayout[contains(@instance,'1')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Gunakan Foto Ini')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'Gunakan Foto Ini')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_first_name')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_first_name')]    ${first_name}
    Set Global Variable    ${first_name}
    cari element by swipe    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_id_card_no')]    0    0    400    300
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_last_name')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_last_name')]    ${last_name}
    Set Global Variable    ${last_name}
    Input Value    id=input_id_card_no    ${no_ktp}
    Set Global Variable    ${no_ktp}
    cari element by swipe    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]    0    0    400    300
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_dob')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_dob')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'2018')]    timeout=${timeout_general}
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'2018')]
    ${height}    Get Window Height
    ${width}    Get Window Width
    ${height_tengah}    Evaluate    ${height} * 0.5
    ${width_tengah}    Evaluate    ${width} * 0.5
    ${height_start}    Evaluate    ${height} * 0.7
    ${height_end}    Evaluate    ${height} * 0.2
    Log    >>> swiping
    Swipe    ${width_tengah}    ${height_end}    ${width_tengah}    ${height_start}
    Sleep    2s
    Log    >>> clicking
    Click A Point    ${width_tengah}    ${height_tengah}    duration=100
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageButton[contains(@resource-id,'android:id/prev')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.ImageButton[contains(@resource-id,'android:id/prev')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageButton[contains(@resource-id,'android:id/prev')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.ImageButton[contains(@resource-id,'android:id/prev')]
    AppiumLibrary.Wait Until Element Is Visible    //android.view.View[contains(@text,'12')]    timeout=5s
    AppiumLibrary.Click Element    //android.view.View[contains(@text,'12')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'OK')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'OK')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]
    Comment    AKADEMIK
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageView[contains(@instance,'0')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.ImageView[contains(@instance,'0')]
    klik okay
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'GALLERY')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'GALLERY')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.RelativeLayout[contains(@instance,'1')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.RelativeLayout[contains(@instance,'1')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Gunakan Foto Ini')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'Gunakan Foto Ini')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_student_no')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_student_no')]    ${no_ktm}
    Set Global Variable    ${no_ktm}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_university')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_university')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Universitas Bandung')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'Universitas Bandung')]
    Set Global Variable    ${university}
    sleep    2s
    cari element by swipe    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_start_date')]    0    0    400    300
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_faculty')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_faculty')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_suggestion')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_suggestion')]    ${faculty}
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'Tambah fakultas baru')]
    Set Global Variable    ${faculty}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_city')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_city')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_suggestion')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_suggestion')]    ${city_university}
    Set Global Variable    ${city_university}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'KOTA BANDUNG')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'KOTA BANDUNG')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_start_date')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_start_date')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'2018')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'2018')]
    Log    >>> swiping
    Swipe    ${width_tengah}    ${height_end}    ${width_tengah}    ${height_start}
    Sleep    2s
    Log    >>> clicking
    Click A Point    ${width_tengah}    ${height_tengah}    duration=100
    sleep    2s
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageButton[contains(@resource-id,'android:id/prev')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.ImageButton[contains(@resource-id,'android:id/prev')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageButton[contains(@resource-id,'android:id/prev')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.ImageButton[contains(@resource-id,'android:id/prev')]
    AppiumLibrary.Wait Until Element Is Visible    //android.view.View[contains(@text,'10')]    timeout=5s
    AppiumLibrary.Click Element    //android.view.View[contains(@text,'10')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'OK')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'OK')]
    ${start_month}=    AppiumLibrary.Get Text    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_start_date')]
    ${start_month}=    Get Substring    ${start_month}    3
    ${start_month}=    Get Substring    ${start_month}    \    -5
    Set Global Variable    ${start_month}
    ${start_year}=    AppiumLibrary.Get Text    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_start_date')]
    ${start_year}=    Get Substring    ${start_year}    -4
    Set Global Variable    ${start_year}
    cari element by swipe    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_gpa')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_end_date')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_end_date')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'2018')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'2018')]
    Swipe    ${width_tengah}    ${height_start}    ${width_tengah}    ${height_end}
    Sleep    2s
    Log    >>> clicking
    Click A Point    ${width_tengah}    ${height_tengah}    duration=100
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageButton[contains(@resource-id,'android:id/prev')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.ImageButton[contains(@resource-id,'android:id/prev')]
    AppiumLibrary.Wait Until Element Is Visible    //android.view.View[contains(@text,'10')]    timeout=5s
    AppiumLibrary.Click Element    //android.view.View[contains(@text,'10')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'OK')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'OK')]
    ${end_month}=    AppiumLibrary.Get Text    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_end_date')]
    ${end_month}=    Get Substring    ${end_month}    3
    ${end_month}=    Get Substring    ${end_month}    \    -5
    Set Global Variable    ${end_month}
    ${end_year}=    AppiumLibrary.Get Text    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_end_date')]
    ${end_year}=    Get Substring    ${end_year}    -4
    Set Global Variable    ${end_year}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_gpa')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_gpa')]    3
    cari element by swipe    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/text_previous')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]
    Comment    ALAMAT    ALAMAT
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/text_spinner_item')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/text_spinner_item')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'${tipe_address1}')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'${tipe_address1}')]
    Set Global Variable    ${tipe_address1}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_fix_address')]    timeout=10s
    ${address1}=    Remove String Using Regexp    ${address1}    \t
    ${address1}=    Remove String Using Regexp    ${address1}    \n
    ${address1}=    Remove String Using Regexp    ${address1}    \r\n
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_fix_address')]    ${address1}
    Set Global Variable    ${address1}
    sleep    2s
    cari element by swipe    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_fix_postal_code')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_fix_city')]    timeout=${timeout_general}
    AppiumLibrary.Click Element    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_fix_city')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_suggestion')]    timeout=10s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_suggestion')]    ${city_address1}
    Set Global Variable    ${city_address1}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'KOTA BANDUNG')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'KOTA BANDUNG')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_fix_district')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_fix_district')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_suggestion')]    timeout=10s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_suggestion')]    ${district_address1}
    Set Global Variable    ${district_address1}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'${district_address1}')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'${district_address1}')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_fix_postal_code')]    timeout=10s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_fix_postal_code')]    ${postal_code1}
    Set Global Variable    ${postal_code1}
    cari element by swipe    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_city')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Kost')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'Kost')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'${tipe_address2}')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'${tipe_address2}')]
    Set Global Variable    ${tipe_address2}
    ${address2}=    Remove String Using Regexp    ${address2}    \t
    ${address2}=    Remove String Using Regexp    ${address2}    \n
    ${address2}=    Remove String Using Regexp    ${address2}    \r\n
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_address')]    timeout=10s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_address')]    ${address2}
    Set Global Variable    ${address2}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_city')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_city')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_suggestion')]    timeout=10s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_suggestion')]    ${city_address2}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'${city_address2}')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'${city_address2}')]
    Set Global Variable    ${city_address2}
    sleep    2s
    cari element by swipe    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/text_previous')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_district')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_district')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_suggestion')]    timeout=10s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_suggestion')]    ${district_address2}
    Set Global Variable    ${district_address2}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'${district_address2}')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'${district_address2}')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_postal_code')]    timeout=10s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_postal_code')]    ${postal_code2}
    Set Global Variable    ${postal_code2}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]
    Comment    LATAR BELAKANG ORANG TUA    LATAR BELAKANG ORANG TUA
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_first_name_1')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_first_name_1')]    ${first_name_parent1}
    Set Global Variable    ${first_name_parent1}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_last_name_1')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_last_name_1')]    ${last_name_parent1}
    Set Global Variable    ${last_name_parent1}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_occupation_1')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_occupation_1')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Wiraswasta')]    timeout=10s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'Wiraswasta')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_phone_1')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_phone_1')]    ${no_hp_parent1}
    ${no_hp_parent1}=    Catenate    +62${no_hp_parent1}
    Set Global Variable    ${no_hp_parent1}
    cari element by swipe    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/text_previous')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_first_name_2')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_first_name_2')]    ${first_name_parent2}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_last_name_2')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_last_name_2')]    ${last_name_parent2}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_occupation_2')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_occupation_2')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Wiraswasta')]    timeout=10s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'Wiraswasta')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_phone_2')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_phone_2')]    ${no_hp_parent2}
    Set Global Variable    ${no_hp_parent2}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]
    Comment    EXTRA    EXTRA
    sleep    2s
    cari element by swipe    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/text_previous')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/text_empty')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/text_empty')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Mobil')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'Mobil')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageView[contains(@resource-id,'id.co.cicil.staging:id/image_photo')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.ImageView[contains(@resource-id,'id.co.cicil.staging:id/image_photo')]
    comment    Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Okay')]    timeout=6s
    comment    Click Element    //android.widget.Button[contains(@text,'Okay')]
    klik okay
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'GALLERY')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'GALLERY')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.RelativeLayout[contains(@instance,'1')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.RelativeLayout[contains(@instance,'1')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Gunakan Foto Ini')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'Gunakan Foto Ini')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.CheckBox[contains(@resource-id,'id.co.cicil.staging:id/checkbox_agreement')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.CheckBox[contains(@resource-id,'id.co.cicil.staging:id/checkbox_agreement')]
    sleep    4s
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'android:id/button2')]    timeout=${timeout_general}
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'android:id/button2')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageButton[contains(@index,'0')]    timeout=7s
    AppiumLibrary.Click Element    //android.widget.ImageButton[contains(@index,'0')]

order
    ${down_payment}=    Set Variable    500000
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.FrameLayout[contains(@resource-id,'id.co.cicil.staging:id/nav_home')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.FrameLayout[contains(@resource-id,'id.co.cicil.staging:id/nav_home')]
    Comment    Wait Until Element Is Visible    //android.widget.ImageButton[contains(@resource-id,'id.co.cicil.staging:id/button_close')]    timeout=5s
    Comment    Click Element    //android.widget.ImageButton[contains(@resource-id,'id.co.cicil.staging:id/button_close')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/text_example_url')]    timeout=10s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/text_example_url')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.LinearLayout[contains(@resource-id,'id.co.cicil.staging:id/linear_search')]    timeout=10s
    AppiumLibrary.Click Element    //android.widget.LinearLayout[contains(@resource-id,'id.co.cicil.staging:id/linear_search')]
    sleep    2s
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/text_price')]    timeout=10s
    ${price}=    AppiumLibrary.Get Text    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/text_price')]
    ${price}=    Remove String    ${price}    Rp \
    Log    >>remove
    ${price}=    Remove String    ${price}    .
    Log    >>remove2
    Set Global Variable    ${price}
    cari element by swipe    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/text_maximum_tenure')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_downpayment')]    timeout=5s
    Clear Text    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_downpayment')]
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_downpayment')]    ${down_payment}
    Set Global Variable    ${down_payment}
    Tap    //android.widget.SeekBar[contains(@resource-id,'id.co.cicil.staging:id/seekbar_tenure')]    x_offset=150    y_offset=0    count=1
    ${seekbar}=    Get Element Location    //android.widget.SeekBar[contains(@resource-id,'id.co.cicil.staging:id/seekbar_tenure')]
    ${seekbar}=    Convert To String    ${seekbar}
    ${y}=    Get Substring    ${seekbar}    6
    ${y}=    Get Substring    ${y}    \    3
    Click A Point    x=450    y=${y}    duration=100
    sleep    1s
    cari element by swipe    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/textinput_counter')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_note')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_note')]    automated temptatis
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'android:id/button2')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'android:id/button2')]
    sleep    1s
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Alamat Tinggal Sehari-Hari Selama Kuliah')]    timeout=5s
    cari element by swipe    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_next')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Alamat Tinggal Sehari-Hari Selama Kuliah')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'Alamat Tinggal Sehari-Hari Selama Kuliah')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_next')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_next')]
    sleep    1s
    cari element by swipe    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_next')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_next')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_next')]
    cari element by swipe    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_submit')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_submit')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_submit')]
    sleep    1s
    cari element by swipe    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_submit')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.CheckBox[contains(@resource-id,'id.co.cicil.staging:id/cb_agreement')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.CheckBox[contains(@resource-id,'id.co.cicil.staging:id/cb_agreement')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_submit')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_submit')]
    sleep    1s
    Comment    cari element by swipe    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]    0    0    400    200
    Comment    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_resend_otp')]    timeout=5s
    Comment    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_resend_otp')]
    Sleep    35s
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_otp')]
    AppiumLibrary.Click Element    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_otp')]
    Sleep    15s
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_order_process')]    timeout=${timeout_general}
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_order_process')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@instance,'4')]    timeout=${timeout_general}
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@instance,'4')]
    sleep    1s
    ${order_no}=    AppiumLibrary.Get Text    //android.widget.TextView[contains(@instance,'0')]
    ${order_no}=    Get Substring    ${order_no}    1
    Log    text=${order_no}
    Set Global Variable    ${order_no}
    ${tenure}=    AppiumLibrary.Get Text    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/tv_order_tenure')]
    ${tenure}=    Get Substring    ${tenure}    \    -6
    log    >>tenure
    Set Global Variable    ${tenure}
    ${installment}=    AppiumLibrary.Get Text    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/tv_order_installment')]
    ${installment}=    Remove String    ${installment}    .
    log    >>installment
    Set Global Variable    ${installment}
    sleep    1s
    Close Application

verification, assign, approve
    Verification
    assign ambassador
    Approve Order

meetup and agreement
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=7.1    deviceName=192.168.29.101:5555    appPackage=id.co.cicil.staging    appActivity=id.co.cicil.ui.launcher.LauncherActivity
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Click Element    //*[contains(@text,"Lanjut")]
    AppiumLibrary.Click Element    //*[contains(@text,"Lanjut")]
    AppiumLibrary.Click Element    //*[contains(@text,"Lanjut")]
    AppiumLibrary.Click Element    //*[contains(@text,"Lanjut")]
    Comment    Click Element    id=btn_start
    AppiumLibrary.Wait Until Element Is Visible    //*[contains(@text,"Cek Sekarang")]    timeout=5s
    AppiumLibrary.Click Element    //*[contains(@text,"Cek Sekarang")]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.FrameLayout[contains(@resource-id,'id.co.cicil.staging:id/nav_account')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.FrameLayout[contains(@resource-id,'id.co.cicil.staging:id/nav_account')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_email')]    timeout=5s
    Comment    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_email')]
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_email')]    ${ID_ambassador}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_password')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_password')]    ${pwd}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Masuk')]
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'Masuk')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Student List')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'Student List')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/menu_search')]    timeout=10s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/menu_search')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/search_bar_et')]
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/search_bar_et')]    ${order_no}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'${order_no}')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'${order_no}')]
    cari element by swipe    //android.widget.RelativeLayout[contains(@resource-id,'id.co.cicil.staging:id/layout_container_menu_schedule')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.RelativeLayout[contains(@resource-id,'id.co.cicil.staging:id/layout_container_menu_schedule')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.RelativeLayout[contains(@resource-id,'id.co.cicil.staging:id/layout_container_menu_schedule')]
    sleep    1s
    cari element by swipe    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_save')]    0    0    400    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageView[contains(@resource-id,'id.co.cicil.staging:id/image_calendar')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.ImageView[contains(@resource-id,'id.co.cicil.staging:id/image_calendar')]
    AppiumLibrary.Wait Until Element Is Visible    //android.view.View[contains(@text,'30')]    timeout=5s
    AppiumLibrary.Click Element    //android.view.View[contains(@text,'30')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'OK')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'OK')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_note')]    timeout=5s
    input value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_note')]    di kantin
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_save')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_save')]
    sleep    1s
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'${order_no}')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'${order_no}')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.RelativeLayout[contains(@resource-id,'id.co.cicil.staging:id/layout_container_menu_photo')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.RelativeLayout[contains(@resource-id,'id.co.cicil.staging:id/layout_container_menu_photo')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageView[contains(@resource-id,'id.co.cicil.staging:id/image_photo')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.ImageView[contains(@resource-id,'id.co.cicil.staging:id/image_photo')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'OKAY')]    timeout=6s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'OKAY')]
    AppiumLibrary.Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]    timeout=5s
    AppiumLibrary.Click Element    xpath=//android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]    timeout=5s
    AppiumLibrary.Click Element    xpath=//android.widget.Button[contains(@resource-id,'com.android.packageinstaller:id/permission_allow_button')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'GALLERY')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'GALLERY')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.RelativeLayout[contains(@instance,'1')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.RelativeLayout[contains(@instance,'1')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Gunakan Foto Ini')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'Gunakan Foto Ini')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Complete')]    timeout=13s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'Complete')]
    cari element by swipe    //android.widget.TextView[contains(@text,'${order_no}')]    0    0    600    200
    AppiumLibrary.Capture Page Screenshot
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageButton[contains(@resource-id,'id.co.cicil.staging:id/search_bar_back')]    timeout=${timeout_general}
    AppiumLibrary.Click Element    //android.widget.ImageButton[contains(@resource-id,'id.co.cicil.staging:id/search_bar_back')]
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@resource-id,'id.co.cicil.staging:id/expanded_menu')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'PENGATURAN')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'PENGATURAN')]
    sleep    1s
    cari element by swipe    //android.widget.TextView[contains(@text,'Logout')]    0    0    500    300
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Logout')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'Logout')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'YA')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'YA')]

waiting downpayment
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.FrameLayout[contains(@resource-id,'id.co.cicil.staging:id/nav_account')]    timeout=10s
    AppiumLibrary.Click Element    //android.widget.FrameLayout[contains(@resource-id,'id.co.cicil.staging:id/nav_account')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_email')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_email')]    ${email}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_password')]    timeout=5s
    Input Value    //android.widget.EditText[contains(@resource-id,'id.co.cicil.staging:id/input_password')]    ${pwd}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Masuk')]
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'Masuk')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Profile')]    timeout=20s
    Comment    ${text button}=    Get Text    id=text_title_suggestion
    Comment    BuiltIn.Should Contain    ${text button}    Profilku
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.FrameLayout[contains(@resource-id,'id.co.cicil.staging:id/nav_my_order')]    timeout=20s
    AppiumLibrary.Click Element    //android.widget.FrameLayout[contains(@resource-id,'id.co.cicil.staging:id/nav_my_order')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'${order_no}')]    timeout=20s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'${order_no}')]
    sleep    2s
    cari element by swipe    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_cancel')]    0    0    600    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_payment')]    timeout=20s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/btn_payment')]
    sleep    2s
    cari element by swipe    //android.widget.Button[contains(@resource-id,'id.co.cicil.staging:id/button_submit')]    0    0    600    200
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[contains(@text,'Bank BRI Virtual Account')]    timeout=20s
    AppiumLibrary.Click Element    //android.widget.TextView[contains(@text,'Bank BRI Virtual Account')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Bayar Sekarang')]    timeout=10s
    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'Bayar Sekarang')]
    sleep    2s
    ${nomor_va}=    AppiumLibrary.Get Text    //android.widget.TextView[contains(@text,'87')]
    Comment    ${va_number}    Set Variable    ${nomor_va}
    Comment    BuiltIn.Should Contain    ${nomor_va}=    8777810000000405
    ${inquirypayment}=    Create Dictionary    MALLID=4924    CHAINMERCHANT=0    AMOUNT=${down_payment}    WORDS=d68265033cdf4cc434f20787e0038ce4f0da4a10    PAYMENTCHANNEL=22
    ...    PAYMENTCODE=${nomor_va}
    Create Session    acceptor    http://api-staging.cicil.co.id/v1
    ${headers}=    Create Dictionary    key=token    Content-Type=application/x-www-form-urlencoded
    ${resppayment}=    Post Request    acceptor    /payment/callback/doku/inquiry    data=${inquirypayment}    headers=${headers}
    ${INQUIRY_RESPONSE}=    Parse Xml    ${resppayment.text}
    ${x}    Get Element    ${INQUIRY_RESPONSE}    TRANSIDMERCHANT
    Log    ${x.text}
    ${notifypayment}    Create Dictionary    MALLID=0    AMOUNT=${down_payment}    CHAINMERCHANT=0    TRANSIDMERCHANT=${x.text}    WORDS=737cb3824d3c52be9b5f608b643f3ac0b26694a3
    ...    STATUSTYPE=P    RESPONSECODE=0    APPROVALCODE=102476957    RESULTMSG=SUCCESS    PAYMENTCHANNEL=34    PAYMENTCODE=${nomor_va}
    ...    SESSIONID=session1    BANK=BRI    MCN=${nomor_va}    PAYMENTDATETIME=20171119130851    VERIFYID=0    VERIFYSCORE=-1
    ...    VERIFYSTATUS=NA
    ${headers2}=    Create Dictionary    Content-Type=application/json
    ${resppayment2}    Post Request    acceptor    /payment/callback/doku/notify    data=${notifypayment}    headers=${headers}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageButton[contains(@instance,'0')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.ImageButton[contains(@instance,'0')]
    sleep    1s
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.ImageButton[contains(@instance,'0')]    timeout=5s
    AppiumLibrary.Click Element    //android.widget.ImageButton[contains(@instance,'0')]
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.FrameLayout[contains(@resource-id,'id.co.cicil.staging:id/nav_my_order')]    timeout=20s
    AppiumLibrary.Click Element    //android.widget.FrameLayout[contains(@resource-id,'id.co.cicil.staging:id/nav_my_order')]

processing
    Pending doc
    For ordering
    For review
    Comment    Proceed shipping
    Comment    Shipment
    Comment    delivery confirm

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

*** Keywords ***
ID
    Input Value    id=input_email    bangkev12+appweb3@gmail.com

password baru
    Input Value    id=input_password    12345678A
    Input Value    id=input_verify_password    12345678A

klik okay
    Run Keyword If    '${useCapitalOKButton}'=='1'    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'OKAY')]    timeout=6s
    Run Keyword If    '${useCapitalOKButton}'=='1'    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'OKAY')]
    Run Keyword If    '${useCapitalOKButton}'=='0'    AppiumLibrary.Wait Until Element Is Visible    //android.widget.Button[contains(@text,'Okay')]    timeout=6s
    Run Keyword If    '${useCapitalOKButton}'=='0'    AppiumLibrary.Click Element    //android.widget.Button[contains(@text,'Okay')]
