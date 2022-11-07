*** Settings ***
Documentation    Keywords for automationpractice
Library   SeleniumLibrary
Resource  Variables.robot
Library   FakerLibrary




*** Keywords ***
Login User
      [Arguments]    ${username}    ${password}
      Open Browser                  ${URL}    ${BROWSER}
      Maximize Browser Window
      Wait and Click Element                 ${SIGNIN_LINK}
      Wait and Input Text                    ${EMAIL_ADDRESS_FIELD}     ${username}
      Wait and Input Text                   ${PASSWORD_FIELD}    ${password}
      Click Button                  ${LOGIN_BTN}
      Page Should Contain           ${PAGE-CONTAIN}

Login with Incorrect username
      [Arguments]    ${username}    ${password}
      Open Browser                  ${URL}    ${BROWSER}
      Maximize Browser Window
      Wait and Click Element                ${SIGNIN_LINK}
      Wait and Input Text                    ${EMAIL_ADDRESS_FIELD}    ${username}
      Wait and Input Text                   ${PASSWORD_FIELD}    ${password}
      Click Button                  ${LOGIN_BTN}
      Page Should Contain           ${AUTH-FAIL}

Logo and Add to cart displayed
     Open Browser                  ${URL}    ${BROWSER}
     Wait Until Element Is Visible  ${APP_LOGO}  10s
     Wait Until Element Is Visible  ${SHOPPING_CART}    10s
     Capture Page Screenshot

#DATA DRIVEN
Login with Incorrect password
      [Arguments]    ${username}    ${password}
      Open Browser                  ${URL}    ${BROWSER}
      Maximize Browser Window
      Wait and Click Element                 ${SIGNIN_LINK}
      Wait and Input Text                    ${EMAIL_ADDRESS_FIELD}   ${username}
      Wait and Input Text                    ${PASSWORD_FIELD}   ${password}
      Click Button                  ${LOGIN_BTN}
      Page Should Contain           ${AUTH-FAIL}

#DATA DRIVEN
Retrieve forgotten password
    [Arguments]    ${forgot_password_link}    ${forgot_password_email_address_field}  ${email_address}  ${retrieve_password_btn}
    Wait and Click Element   ${forgot_password_link}
    Wait and Input Text    ${forgot_password_email_address_field}    ${email_address}
    Click Button    ${retrieve_password_btn}
    Page Should Contain    A confirmation email has been sent to your address: ${email_address}


Get to login page
     Open Browser                  ${URL}    ${BROWSER}
     Maximize Browser Window
     Wait and Click Element                 ${SIGNIN_LINK}
     
     
Wait and Click Element
    [Documentation]  wait until element is enabled before clicking
    [Arguments]  ${selector}  ${timeout}=10s
    Wait Until Element Is Enabled    ${selector}
    Click Element    ${selector}

Wait and Input Text
    [Documentation]  wait until element is enabled before inputing text
    [Arguments]  ${selector}  ${text}  ${timeout}=10s
    Wait Until Element Is Enabled    ${selector}
    Input Text   ${selector}  ${text}

Enter email for new user and click create account btn
     ${email}=      FakerLibrary.email
     log  ${email}
     Set Test Variable    ${email}
     Wait and Input Text  ${NEW_USER_EMAIL_FIELD}    ${email}
     Wait and Click Element   ${CREATE_ACCT_BTN}

Enter firstname, lastname and password
     [Arguments]    ${firstname}    ${lastname}  ${password}
     Wait and Input Text    ${FIRST_NAME_FIELD}    ${firstname}
     Wait and Input Text    ${LAST_NAME_FIELD}    ${lastname}
     Wait and Input Text    ${USER_PWD_FIELD}    ${password}

Select user date of birth in days, months and years and tick check boxes
    Sleep    5
    Select From List By Index    ${DOB_DAY}  7
    Sleep    5
    Select From List By Index    ${DOB_MONTH}  5
    Sleep    5
    Select From List By Value    ${DOB_YEAR}  1991
    Sleep    5
    Select Checkbox    ${NEWS_LETTER}
    Sleep    5
    Select Checkbox    ${SPECIAL_OFFER}


Enter address, city, state, postcode, mobile, alias and click on register
    Wait and Input Text    ${NEW_USER_ADDRESS}    Island
    Wait and Input Text     ${NEW_USER_CITY}      Houston
    Select From List By Label     ${NEW_USER_STATE}     Texas
    Wait and Input Text     ${NEW_USER_POSTCODE}  33645
    Wait and Input Text     ${NEW_USER_PHONE}      8976435565
    Wait and Input Text    ${NEW_USER_ADDRESS_ALIAS}     Ogbe
    Wait and Click Element     ${REGISTER_BTN}
    Wait Until Page Contains    Emma Okoli


Modify Address
    Wait and Input Text    ${NEW_USER_ADDRESS}    Mainland
    Wait and Input Text     ${NEW_USER_CITY}     Atlanta
    Select From List By Label     ${NEW_USER_STATE}     Georgia
    Wait and Input Text     ${NEW_USER_POSTCODE}  08989
    Wait and Input Text     ${NEW_USER_PHONE}      2222222
    Wait and Input Text    ${NEW_USER_ADDRESS_ALIAS}    Test
    Wait and Click Element     ${SAVE_BTN}
    #Wait Until Page Contains    Emma Okoli


Add a new address and save
    Wait and Click Element  ${MY_ADDRESSES}
    Wait and Click Element  ${NEW_ADDRESSES}
    Modify Address
    Wait Until Page Contains    Georgia  10


Delete address and close browser
    Wait and Click Element  ${DELETE_ADDRESS_BTN}
    Handle Alert  Accept
    Page Should Not Contain    Georgia  10
    Close Browser
