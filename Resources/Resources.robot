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


*** Keywords ***
Prepare Browser
    Register Info       Opening browser ${BROWSER}, URL: ${URL}
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window
    Register Info       Browser ready.

Open Login Fields
    Register Info       Opening login fields...
    Wait Until Element Is Visible   //*[@data-reactid='.0.2.0.0.0.0.2.0.2']
    Click Element                   //*[@data-reactid='.0.2.0.0.0.0.2.0.2']
    Register Info       Login fields ready.

Insert Valid Credentials
    Register Info       Inserting valid credentials...
    Wait Until Element Is Visible       //*[@data-reactid='.0.2.0.1.0.0.0.0.1.1.1']
    Input Text          //*[@data-reactid='.0.2.0.1.0.0.0.0.1.1.1']   ${EMAIL VALUE}
    Wait Until Element Is Visible       //*[@data-reactid='.0.2.0.1.0.0.0.0.1.2.1']
    Input Text          //*[@data-reactid='.0.2.0.1.0.0.0.0.1.2.1']   ${PASSWORD VALUE}
    Register Info       Valid credentials inserted.

Confirm Login
    Register Info       Searching login button...
    Wait Until Element Is Visible   //*[@data-reactid='.0.2.0.1.0.0.0.0.1.3.0']
    Click Element                   //*[@data-reactid='.0.2.0.1.0.0.0.0.1.3.0']
    Register Info       Login button founded and clicked.


Open My Account
    Register Info                       Selecting "My Account" option.
    Wait Until Element Is Visible       //*[@id='content']/div/div[2]/div/header/div/div/div[3]/div/div/button/span[1]
    Click Element                       //*[@id='content']/div/div[2]/div/header/div/div/div[3]/div/div/button/span[1]
    Wait Until Element Is Visible       //*[@id='content']/div/div[2]/div/header/div/div/div[3]/div/div/ul/li[1]/a
    Click Element                       //*[@id='content']/div/div[2]/div/header/div/div/div[3]/div/div/ul/li[1]/a
    Register Info                       "My Account" option selected.

Open Register Key Fields
     Register Info                      Opening register key fields...
     Wait Until Element Is Visible      //*[@id='content']/div/div[2]/div/div/section[2]/div/div/div[2]/p/a/span[2]
     Click Element                      //*[@id='content']/div/div[2]/div/div/section[2]/div/div/div[2]/p/a/span[2]
     Register Info                      Register key fields are ready.

Insert Key Values
      Register Info                         Inserting key values...
      Wait Until Element Is Visible         //*[@id='name']
      Input Text                            //*[@id='name']           ${KEY NAME VALUE}
      Input Text                            //*[@id='description']    ${DESCRIPTION VALUE}
      ${IP ADDRESS}        Find Ip
      Input Text                            //*[@id='range-0']        ${IP ADDRESS}
      Register Info                         Key values inserted.

Confirm Key Creation
       Register Info                        Confirming key creation...
       Wait Until Element Is Visible        //*[@id='content']/div/div[2]/div/div/section/div/div/div[2]/form/div[5]/button
       Click Element                        //*[@id='content']/div/div[2]/div/div/section/div/div/div[2]/form/div[5]/button
       Register Info                        Key creation is done.

Open Created Key
        Register Info                       Opening created key...
        Wait Until Element Is Visible       partial link:${KEY NAME VALUE}
        Click Element                       partial link:${KEY NAME VALUE}
        Register Info                       Created key found.

Register Members
        Register Info                   Searching for token value...
        Wait Until Element Is Visible   //*[@id='content']/div/div[2]/div/div/section/div/div/div[2]/form/div[1]/div/samp
        ${TOKEN}          Get Text      //*[@id='content']/div/div[2]/div/div/section/div/div/div[2]/form/div[1]/div/samp
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
        Wait Until Element Is Visible   //*[@id='content']/div/div[2]/div/div/section/div/div/div[2]/form/div[5]/button/span[1]
        Click Element                   //*[@id='content']/div/div[2]/div/div/section/div/div/div[2]/form/div[5]/button/span[1]
        Wait Until Element Is Visible   //*[@id='content']/div/div[2]/div/div/section[2]/div/div/div[2]/ul/div/span[3]
        Register Info                   Key deleted.

