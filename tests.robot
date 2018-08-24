*** Settings ***
Library         AppiumLibrary

Test setup  I open the calculator
Test teardown  Close All Applications

*** Variables ***
${BUTTON}    id=com.simplemobiletools.calculator:id/btn_
${BUTTON_1}    id=com.simplemobiletools.calculator:id/btn_1
${BUTTON_PLUS}    id=com.simplemobiletools.calculator:id/btn_plus
${BUTTON_EQUALS}    id=com.simplemobiletools.calculator:id/btn_equals
${LABEL_RESULT}    id=com.simplemobiletools.calculator:id/result

${HUB}  https://809f39df.ngrok.io/wd/hub

*** Test Cases ***
One plus One equals Two
	
	# Start the calculator
	Wait Until Element Is Visible  id=com.simplemobiletools.calculator:id/result
	
	# Perform actions	
	Click Element  ${BUTTON_1}
	Click Element  ${BUTTON_PLUS}
	Click Element  ${BUTTON_1}
	Click Element  ${BUTTON_EQUALS}
	
	# Verify output
    Element Text Should Be  ${LABEL_RESULT}  2
	
	
One plus One equals Two (Improved)

    When I enter 1 plus 1
    Then I see result 2


*** Keywords ***
I open the calculator
	Open Application  ${HUB}  platformName=Android  platformVersion=7.0  deviceName=Honor_8_Lite  app=${APP}  automationName=appium  appPackage=com.simplemobiletools.calculator  appActivity=.activities.SplashActivity
	
I enter ${first_number} plus ${second_number}
    Click Element  ${BUTTON}${first_number}
	Click Element  ${BUTTON_PLUS}
	Click Element  ${BUTTON}${second_number}
	Click Element  ${BUTTON_EQUALS}
	
I see result ${result}
    Element Text Should Be  ${LABEL_RESULT}  ${result}
