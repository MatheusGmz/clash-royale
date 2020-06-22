*** Settings ***
Resource    ../Resources/Resources.robot
Test Setup     Prepare Browser
Test Teardown  Close Browser

*** Test Cases ***
Expected Path
    Open Login Fields
    Insert Valid Credentials
    Confirm Login
    Open My Account
    Open Register Key Fields
    Insert Key Values
    Confirm Key Creation
    Open Created Key
    Register Members
    Delete Key