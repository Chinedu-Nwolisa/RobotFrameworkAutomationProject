*** Variables ***


${URL}                  http://automationpractice.com/index.php
${BROWSER}              chrome
${APP_LOGO}             id:header_logo
${SHOPPING_CART}        class:shopping_cart
${SIGNIN_LINK}          class:login
${EMAIL_ADDRESS_FIELD}  id:email
${PASSWORD_FIELD}       id:passwd
${EMAIL_ADDRESS}        ${EMPTY}
${PASSWORD}             ${EMPTY}
${LOGIN_BTN}            name:SubmitLogin
${ERROR_MESSAGE}        Authentication failed
${PAGE-CONTAIN}         Chinedu Nwolisa
${AUTH-FAIL}            Authentication failed
${FORGOT_PW-LINK}       xpath://*[@id="login_form"]/div/p[1]/a
${FORGOT_PW_EMAIL_ADDRESS}  id:email
${RETRIVE_PW_BTN}       xpath://*[@id="form_forgotpassword"]/fieldset/p/button
${ALERT_SUCCESS}       xpath://*[@id="center_column"]/div/p
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
${MY_ADDRESSES}      xpath://*[@id="center_column"]/div/div[1]/ul/li[3]/a/span
${NEW_ADDRESSES}       xpath://*[@id="center_column"]/div[2]/a/span
${SAVE_BTN}     id:submitAddress
${DELETE_ADDRESS_BTN}    //*[@id="center_column"]/div[1]/div/div[2]/ul/li[9]/a[2]/span



