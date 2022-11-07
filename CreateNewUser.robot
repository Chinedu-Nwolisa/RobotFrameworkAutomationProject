*** Settings ***
Documentation    Creating a new user account
Library   SeleniumLibrary
Resource  MyKeywords.robot
Resource  Variables.robot
#Suite Setup  Get to login page
Suite Teardown  Close All Browsers

*** Test Cases ***
Verify that user can create a new account
    Enter email for new user and click create account btn
    Enter firstname, lastname and password  Emma  Okoli  Optimistic
    Select user date of birth in days, months and years and tick check boxes
    Enter address, city, state, postcode, mobile, alias and click on register


Add new address to user profile
    [Tags]  nedu
    Login User  ${EMAIL_ADDRESS}   ${PASSWORD}
    Add a new address and save
    [Teardown]  Delete address and close browser









*** Keywords ***
Enter email for new user and click create account btn
     ${email}=  FakerLibrary.email
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







##Create New User Account
#    [Arguments]    ${email}    ${password}
#    Wait and Input Text    ${NEW_USER_EMAIL_FIELD}    ${email}
#    Wait and Click Element   ${CREATE_ACCT_BTN}
#    Wait and Click Element     ${GENDER}
#    Wait and Input Text    ${FIRST_NAME_FIELD}   Emma
#    Wait and Input Text     ${LAST_NAME_FIELD}  Okoli
#    Wait and Input Text     ${USER_PWD_FIELD}   ${password}
#    Select From List By Index    ${DOB_DAY}  7
#    Select From List By Index    ${DOB_MONTH}  5
#    Select From List By Value    ${DOB_YEAR}  1991
#    Select Checkbox    ${NEWS_LETTER}
#    Select Checkbox    ${SPECIAL_OFFER}
#    Wait and Input Text    ${NEW_USER_ADDRESS}    Island
#    Wait and Input Text     ${NEW_USER_CITY}      Houston
#    Select From List By Label     ${NEW_USER_STATE}     Texas
#    Wait and Input Text     ${NEW_USER_POSTCODE}  33645
#    Wait and Input Text     ${NEW_USER_PHONE}      8976435565
#    Wait and Input Text    ${NEW_USER_ADDRESS_ALIAS}     Ogbe
#    Wait and Click Element     ${REGISTER_BTN}


*** Variables ***
${NEW_USER_EMAIL_FIELD}     id:email_create
${CREATE_ACCT_BTN}          name:SubmitCreate
${GENDER}                   id:id_gender1
${FIRST_NAME_FIELD}  id:customer_firstname
${LAST_NAME_FIELD}   id:customer_lastname
${USER_PWD_FIELD}   id:passwd
${USER_NAME}    ${EMPTY}
${USER_PWD}     ${EMPTY}
${DOB_DAY}   id:days
${DOB_MONTH}   id:months
${DOB_YEAR}   id:years
${NEWS_LETTER}  id:newsletter
${SPECIAL_OFFER}  id:optin
${NEW_USER_ADDRESS}  id:address1
${NEW_USER_CITY}   id:city
${NEW_USER_STATE}  id:id_state
${NEW_USER_POSTCODE}   id:postcode
${NEW_USER_PHONE}   id:phone_mobile
${NEW_USER_ADDRESS_ALIAS}  id:alias
${REGISTER_BTN}   id:submitAccount


