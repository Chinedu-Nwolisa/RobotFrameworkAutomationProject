*** Settings ***
Documentation   validate application homepage and login page
Library         SeleniumLibrary
Resource        MyKeywords.robot
Suite Teardown  Close All Browsers





*** Test Cases ***
Verify logo and Add to cart are displayed

     Open Browser  ${URL}    ${BROWSER}
     Wait Until Element Is Visible    ${APP_LOGO}
     Wait Until Element Is Visible    ${SHOPPING_CART}   10s
     Capture Page Screenshot


Valid Login

      Open Browser                  ${URL}    ${BROWSER}
      Maximize Browser Window
      Click Element                 ${SIGNIN_LINK}
      Input Text                    ${EMAIL_ADDRESS_FIELD}     ${EMAIL_ADDRESS}
      Input Text                    ${PASSWORD_FIELD}   ${PASSWORD}
      Click Button                  ${LOGIN_BTN}
      Page Should Contain           ${PAGE-CONTAIN}




Invalid Login 1

      Open Browser    ${URL}    ${BROWSER}
      Maximize Browser Window
      Click Element   ${SIGNIN_LINK}
      Input Text      ${EMAIL_ADDRESS_FIELD}    nwolisachinedu@yahoo.com
      Input Text      ${PASSWORD_FIELD}    Godson2015
      Click Button    ${LOGIN_BTN}
      Page Should Contain    ${AUTH-FAIL}


Invalid Login 2

      Open Browser    ${URL}    ${BROWSER}
      Maximize Browser Window
      Click Element  ${SIGNIN_LINK}
      Input Text      ${EMAIL_ADDRESS_FIELD}    nwolisachinedu2015@yahoo.com
      Input Text      ${PASSWORD_FIELD}    Godson201
      Click Button    ${LOGIN_BTN}
      Page Should Contain    ${AUTH-FAIL}

Valid error messages for incorrect login details
    [Tags]  nedu
    [Template]  Verify error messages for different invalid login scenarios
    #Username                        Password             Error Message
    nwolisachinedu2015@yahoo.com     godson2015           Authentication failed.
    nwolisachinedu@yahoo.com         Godson2015           Authentication failed.
    ${EMPTY}                         Godson2015           An email address required.



*** Keywords ***
Verify error messages for different invalid login scenarios
  [Arguments]   ${username}  ${password}  ${error message}
      Open Browser    ${URL}    ${BROWSER}
      Maximize Browser Window
      Click Element   ${SIGNIN_LINK}
      Input Text      ${EMAIL_ADDRESS_FIELD}     ${username}
      Input Text      ${PASSWORD_FIELD}   ${password}
      Click Button     ${LOGIN_BTN}
      Page Should Contain    ${error message}
      Capture Page Screenshot