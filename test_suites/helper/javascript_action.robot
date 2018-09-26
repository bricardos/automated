*** Keywords ***
Scroll To Xpath
  [Arguments]   ${selector}
  Execute Javascript    window.document.evaluate(`${selector}`, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);

Click Element With Javascript
  [Arguments]   ${selector}
  Execute Javascript    window.document.evaluate(`${selector}`, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

