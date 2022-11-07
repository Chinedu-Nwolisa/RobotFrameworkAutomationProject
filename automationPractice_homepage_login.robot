*** Settings ***
Documentation    validate application homepage and login page
Library   SeleniumLibrary
Resource  MyKeywords.robot
Resource  Variables.robot
Suite Teardown  Close All Browsers




*** Test Cases ***
Verify logo and Add to cart are displayed

    Logo and Add to cart displayed

Valid Login

    Login User  ${EMAIL_ADDRESS}   ${PASSWORD}

Invalid Login 1

      Login with Incorrect username  Nwolisachinedu2015@yahoo.com  ${PASSWORD}


Invalid Login 2

   Login with Incorrect password  ${EMAIL_ADDRESS}  godson2015


To retrive user forgotten password
    [Tags]  nedu
    [Setup]  Get to login page
    Retrieve forgotten password  ${FORGOT_PW-LINK}  ${FORGOT_PW_EMAIL_ADDRESS}  nwolisachinedu2015@yahoo.com  ${RETRIVE_PW_BTN}






#DATA DRIVEN
Valid error messages for incorrect login details

    [Template]  Verify error messages for different invalid login scenarios
    #Username                        Password             Error Message
    nwolisachinedu2015@yahoo.com     godson2015           Authentication failed.
    nwolisachinedu@yahoo.com         Godson2015           Authentication failed.
    ${EMPTY}                         Godson2015           An email address required.





*** Keywords ***
Verify error messages for different invalid login scenarios
  [Arguments]   ${username}  ${password}  ${error message}
      Open Browser    ${URL}     ${BROWSER}
      Maximize Browser Window
      Click Element   ${SIGNIN_LINK}
      Input Text      ${EMAIL_ADDRESS_FIELD}    ${username}
      Input Text      ${PASSWORD_FIELD}   ${password}
      Click Button    ${LOGIN_BTN}
      Page Should Contain    ${error message}
      Capture Page Screenshot