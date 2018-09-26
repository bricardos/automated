*** Variables ***
${formDatePicker}           xpath=//ngb-datepicker
${formDatePickerMonth}      xpath=(//ngb-datepicker-navigation-select/select)[1]
${formDatePickerYear}       xpath=(//ngb-datepicker-navigation-select/select)[2]
${formDatePickerDay}        //ngb-datepicker-month-view

*** Keywords ***
Pick A Date From Date Picker
  [Arguments]   ${year}  ${month}  ${day}

  Wait Until Element Is Visible   ${formDatePicker}

  Click Element                   ${formDatePickerYear}
  Select From List By Value       ${formDatePickerYear}   ${year}

  Click Element                   ${formDatePickerMonth}
  Select From List By Value       ${formDatePickerMonth}  ${month}

  ${activeDayTerm}=   Set Variable    not(contains(@class, "text-muted"))
  ${selectedDay}=     Set Variable    text()="${day}"
  ${day}=             Set Variable    ${formDatePickerDay}//div[${activeDayTerm} and ${selectedDay}]
  Click Element       xpath=${day}
