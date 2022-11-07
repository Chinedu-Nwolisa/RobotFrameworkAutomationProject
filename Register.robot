*** Settings ***
Documentation     UI user acceptance criteria
Library           SeleniumLibrary
Resource          MyKeywords.robot
Suite Teardown    Close All Browsers



*** Test Cases ***
#Register user through web portal
Verify that UI user can register through web portal
     Open Browser                       http://127.0.0.1:8080/    chrome
     Maximize Browser Window
     Wait Until Element Is Visible      xpath:/html/body/nav/h1/a   6s
     Wait Until Element Is Visible      xpath:/html/body/nav/ul/li[1]/a   6s
     Click Element                      xpath:/html/body/nav/ul/li[1]/a
     Wait Until Element Is Visible      xpath:/html/body/section/header/h1   6s
     Input Text                         id:username    Manchester
     Input Text                         name:password    United
     Input Text                         id:firstname    Erik
     Input Text                         name:lastname    TenHag
     Input Text                         id:phone    0123456789
     Click Button                       xpath:/html/body/section/form/input[6]
     Page Should Contain                Log In


Verify that a registered user can login to the app sucessfully (Valid Login)
     [Tags]   valid
     #User successfully logged in
     Open Browser                       http://127.0.0.1:8080/    chrome
     Maximize Browser Window
     Wait Until Element Is Visible      xpath:/html/body/nav/h1/a   6s
     Wait Until Element Is Visible      xpath:/html/body/nav/ul/li[2]/a   6s
     Click Element                      xpath:/html/body/nav/ul/li[2]/a
     Wait Until Element Is Visible      xpath:/html/body/section/header/h1   6s
     Input Text                         id:username    Manchester
     Input Text                         name:password    United
     Click Button                       xpath:/html/body/section/form/input[3]
     Page Should Contain                Manchester
     Page Should Contain                Log Out


Verify that regstered UI user can review own user information from the main view

     #UI user can review own user information
     Open Browser                       http://127.0.0.1:8080/    chrome
     Maximize Browser Window
     Wait Until Element Is Enabled      xpath:/html/body/nav/ul/li[2]/a
     Click Element                      xpath:/html/body/nav/ul/li[2]/a
     Wait Until Element Is Visible      xpath:/html/body/section/header/h1
     Input Text                         id:username    Manchester
     Input Text                         name:password    United
     Click Button                       xpath:/html/body/section/form/input[3]
     Page Should Contain                Manchester
     Wait Until Element Is Visible      xpath:/html/body/section/header/h1
     #Table Should Contain               locator    expected







*** Keywords ***
Provided precondition
