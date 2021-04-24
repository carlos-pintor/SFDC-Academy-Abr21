// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents


// Call the new class/method you created (WelcomeClass)
// and print the message using System.debug
// execute your code by selecting the lines and run the command:
// SFDX: Execute Anonymous Apex with Currently Selected Text
String mensaje = CAPS_WelcomeClass.getWelcomeMessage();
System.debug(LoggingLevel.INFO, 'Mensaje:' + mensaje);

// Call the new method to get the message content (user name and current date attributes)
CAPS_WelcomeClass.Message msg = CAPS_WelcomeClass.getMessage();
System.debug('msg:' + msg);
System.debug('user:' + msg.userName);
System.debug('date:' + msg.currentDate);