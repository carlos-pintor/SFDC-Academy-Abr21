/**
 * @author Carlos Pintor
 * @date 2021-04-17
 * @description Apex Class example to handle first steps with apex coding.
 *              This class implements methods to welcome users
 */
public with sharing class CAPS_WelcomeClass {

    /**
     * @description Gets current user info and current date to create and return a welcome message
     * @return A string message with a welcome message for current user
     */
    public static String getWelcomeMessage() {
        //Create a String variable to save current user name, use UserInfo Class methods
        String userName = UserInfo.getName();
        //Create a String variable to save current date, use Date Class methods
        String currentDate = Date.today() + '';
        //Create a String welcome message to return
        String welcomeMessage = 'Hi ' + userName + ', Welcome to Salesforce. Today is ' + currentDate;
        return welcomeMessage;
    }
}
