*** Settings ***
Library  SeleniumLibrary
Library  ../Libraries/CustomLibrary.py

*** Variables ***
${BROWSER}               chrome
${URL}                   https://developer.clashroyale.com
${EMAIL VALUE}           matheusdossantosgimenez@gmail.com
${PASSWORD VALUE}        RpaTest123
${KEY NAME VALUE}        MrRobotKey_1
${DESCRIPTION VALUE}     Created to test.
${API URL}               https://api.clashroyale.com/v1
${CLAN NAME}             The Resistance
${CLAN PARTIAL TAG}      "#9V2Y"

${FIRST LOGIN LINK}      //*[@data-reactid='.0.2.0.0.0.0.2.0.2']
${EMAIL INPUT}           //*[@data-reactid='.0.2.0.1.0.0.0.0.1.1.1']
${PASSWORD INPUT}        //*[@data-reactid='.0.2.0.1.0.0.0.0.1.2.1']

${CONFIRM LOGIN BUTTON}    //*[@data-reactid='.0.2.0.1.0.0.0.0.1.3.0']
${ACCOUNT EXPAND BUTTON}   //*[@id='content']/div/div[2]/div/header/div/div/div[3]/div/div/button/span[1]

${MY ACCOUNT OPTION}       //*[@id='content']/div/div[2]/div/header/div/div/div[3]/div/div/ul/li[1]/a

${CREATE KEY BUTTON}       //*[@id='content']/div/div[2]/div/div/section[2]/div/div/div[2]/p/a/span[2]

${KEY NAME INPUT}          //*[@id='name']
${DESCRIPTION INPUT}       //*[@id='description']

${IP INPUT}                //*[@id='range-0']

${CONFIRM KEY CREATION}    //*[@id='content']/div/div[2]/div/div/section/div/div/div[2]/form/div[5]/button

${TOKEN VALUE}             //*[@id='content']/div/div[2]/div/div/section/div/div/div[2]/form/div[1]/div/samp

${DELETE KEY BUTTON}       //*[@id='content']/div/div[2]/div/div/section/div/div/div[2]/form/div[5]/button/span[1]

${KEY DELETE CONFIRMATION}      //*[@id='content']/div/div[2]/div/div/section[2]/div/div/div[2]/ul/div/span[3]

*** Keywords ***
Prepare Browser
    Register Info       Opening browser ${BROWSER}, URL: ${URL}
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window
    Register Info       Browser ready.

Open Login Fields
    Register Info       Opening login fields...
    Wait Until Element Is Visible   ${FIRST LOGIN LINK}
    Click Element                   ${FIRST LOGIN LINK}
    Register Info       Login fields ready.

Insert Valid Credentials
    Register Info       Inserting valid credentials...
    Wait Until Element Is Visible       ${EMAIL INPUT}
    Input Text                          ${EMAIL INPUT}   ${EMAIL VALUE}
    Wait Until Element Is Visible       ${PASSWORD INPUT}
    Input Text                          ${PASSWORD INPUT}   ${PASSWORD VALUE}
    Register Info       Valid credentials inserted.

Confirm Login
    Register Info       Searching login button...
    Wait Until Element Is Visible   ${CONFIRM LOGIN BUTTON}
    Click Element                   ${CONFIRM LOGIN BUTTON}
    Register Info       Login button founded and clicked.


Open My Account
    Register Info                       Selecting "My Account" option.
    Wait Until Element Is Visible       ${ACCOUNT EXPAND BUTTON}
    Click Element                       ${ACCOUNT EXPAND BUTTON}
    Wait Until Element Is Visible       ${MY ACCOUNT OPTION}
    Click Element                       ${MY ACCOUNT OPTION}
    Register Info                       "My Account" option selected.

Open Register Key Fields
     Register Info                      Opening register key fields...
     Wait Until Element Is Visible      ${CREATE KEY BUTTON}
     Click Element                      ${CREATE KEY BUTTON}
     Register Info                      Register key fields are ready.

Insert Key Values
      Register Info                         Inserting key values...
      Wait Until Element Is Visible         ${KEY NAME INPUT}
      Input Text                            ${KEY NAME INPUT}          ${KEY NAME VALUE}
      Input Text                            ${DESCRIPTION INPUT}     ${DESCRIPTION VALUE}
      ${IP ADDRESS}        Find Ip
      Input Text                            ${IP INPUT}      ${IP ADDRESS}
      Register Info                         Key values inserted.

Confirm Key Creation
       Register Info                        Confirming key creation...
       Wait Until Element Is Visible        ${CONFIRM KEY CREATION}
       Click Element                        ${CONFIRM KEY CREATION}
       Register Info                        Key creation is done.

Open Created Key
        Register Info                       Opening created key...
        Wait Until Element Is Visible       partial link:${KEY NAME VALUE}
        Click Element                       partial link:${KEY NAME VALUE}
        Register Info                       Created key found.

Register Members
        Register Info                   Searching for token value...
        Wait Until Element Is Visible   ${TOKEN VALUE}
        ${TOKEN}          Get Text      ${TOKEN VALUE}
        Register Info                   Token value found and extracted.
        Register Info                    Searching for clan tag...
        ${CLAN TAG}                      Find Clan Tag    ${API URL}   ${CLAN NAME}   ${CLAN PARTIAL TAG}   ${TOKEN}
        Register Info                    Clan tag founded.
        Register Info                    Searching for clan members...
        ${CLAN MEMBERS}                  Find Clan Members  ${API URL}     ${CLAN TAG}    ${TOKEN}
        Register Info                    Clan members founded.
        Register Info                    Registering clan members...
        Register Clan Members            ${CLAN MEMBERS}
        Register Info                    Clan members registered.

Delete Key
        Register Info                   Cleaning created key...
        Wait Until Element Is Visible   ${DELETE KEY BUTTON}
        Click Element                   ${DELETE KEY BUTTON}
        Wait Until Element Is Visible   ${KEY DELETE CONFIRMATION}
        Register Info                   Key deleted.

