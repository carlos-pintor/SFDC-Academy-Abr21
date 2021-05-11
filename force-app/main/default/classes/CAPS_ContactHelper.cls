/**
 * @author Carlos Pintor
 * @date 2021-05-08
 * @description Apex Class example to handle first steps with apex coding.
 *              This class implements methods to work with DML to create a Contact
 */
public with sharing class CAPS_ContactHelper {
    /**
     * @description Creates a contact and an account with input param values
     * @param name String parameter for contact name
     * @param lastName String parameter for contact last name
     * @param company String parameter for account name
     * @return The newly created contact record
     */
    public static Contact createContact(String name, String lastName, String company) {
        //Account acc = new Account(Name = 'SFDC Account', Description = '', ...);
        Account acc = new Account();
        acc.Name = company;
        Insert acc;

        Contact contact = new Contact();
        contact.FirstName = name;
        contact.LastName = lastName;
        contact.AccountId = acc.Id;
        Insert contact;

        return contact;
    }
}
