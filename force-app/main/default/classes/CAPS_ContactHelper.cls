/**
 * @author Carlos Pintor
 * @date 2021-05-08
 * @description Apex Class example to handle first steps with apex coding.
 *              This class implements methods to work with DML to create a Contact
 */
public with sharing class CAPS_ContactHelper {
    /**
     * @description Creates a contact and an account with input param values
     * @param params Object with params to create a contact record 
     */
    @AuraEnabled
    public static void createContact(ContactParams params){
        System.debug('params:' + params);
        try {
            Account acc = new Account();
            acc.Name = params.companyName;
            Insert acc;

            Contact c = new Contact();
            c.FirstName = params.firstName;
            c.LastName = params.lastName;
            c.AccountId = acc.Id;
            c.Phone = params.phoneNumber;
            c.Email = params.emailAddress;
            Insert c;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class ContactParams {
        @AuraEnabled 
        public String firstName {get; set;}
        @AuraEnabled 
        public String lastName {get; set;}
        @AuraEnabled 
        public String phoneNumber {get; set;}
        @AuraEnabled 
        public String emailAddress {get; set;}
        @AuraEnabled 
        public String companyName {get; set;}
    }
}
