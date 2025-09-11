@RestResource(urlMapping='/GetContactByPhoneSimple/*')
global with sharing class ContactWebServiceSimple {

    @HttpGet
    global static String getContactByPhone() {
        // Get the phone number from the query parameters
        String phone = RestContext.request.params.get('phone');

        // Fetch contacts matching the phone
        List<Contact> contacts = [
            SELECT Id, FirstName, LastName, Email, Phone
            FROM Contact
            WHERE Phone = :phone
        ];

        // Return the contacts as JSON
        return JSON.serialize(contacts[0]);
    }
}