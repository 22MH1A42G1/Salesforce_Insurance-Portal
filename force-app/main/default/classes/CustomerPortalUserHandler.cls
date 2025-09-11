public without sharing class CustomerPortalUserHandler {
    
    @InvocableMethod(label='Create Portal User and Send Password Link')
    public static void createPortalUser(List<Id> customerIds) {
        List<Customer__c> customers = [
            SELECT Id, Name, Email__c 
            FROM Customer__c 
            WHERE Id IN :customerIds
        ];

        // Fetch the Portal Profile
        List<Profile> profiles = [
            SELECT Id 
            FROM Profile 
            WHERE Name = 'Smart Bridge portal user' 
            LIMIT 1
        ];
        if (profiles.isEmpty()) {
            throw new FlowException('Profile "Smart Bridge portal user" not found. Please check profile name.');
        }
        Profile portalProfile = profiles[0];

        // Fetch the Portal Account
        List<Account> accs = [
            SELECT Id 
            FROM Account 
            WHERE Name = 'Portal Customers' 
            LIMIT 1
        ];
        if (accs.isEmpty()) {
            throw new FlowException('Account "Portal Customers" not found.');
        }
        Account portalAccount = accs[0];

        for (Customer__c cust : customers) {
            try {
                // Create Contact and link to Account and Customer__c
                Contact con = new Contact(
                    LastName = cust.Name,
                    Email = cust.Email__c,
                    Customer__c = cust.Id,
                    AccountId = portalAccount.Id
                );
                insert con;

                // Ensure globally unique username
                String uniqueUsername = cust.Email__c + '.' + System.currentTimeMillis() + '@smartbridge.com';

                // Create User and link to Contact
                User u = new User(
                    Username = uniqueUsername,
                    Email = cust.Email__c,
                    LastName = cust.Name,
                    Alias = cust.Name.length() >= 5 ? cust.Name.substring(0, 5) : 'user1',
                    TimeZoneSidKey = 'Asia/Kolkata',
                    LocaleSidKey = 'en_US',
                    EmailEncodingKey = 'UTF-8',
                    LanguageLocaleKey = 'en_US',
                    ProfileId = portalProfile.Id,
                    ContactId = con.Id,
                    IsActive = true
                );
                insert u;

                // Step 1: Trigger Salesforce password setup email
                System.resetPassword(u.Id, true);

                // Step 2: Also send custom email with username and setup link
                String baseUrl = URL.getOrgDomainUrl().toExternalForm();
                String setPasswordLink = baseUrl + '/secur/forgotpassword.jsp?user_id=' + u.Id;

                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new String[] { cust.Email__c });
                email.setSubject('Your Portal Account Details');
                email.setHtmlBody(
                    '<p>Hello ' + cust.Name + ',</p>' +
                    '<p>Your portal account has been created.</p>' +
                    '<p><b>Username:</b> ' + u.Username + '</p>' +
                    '<p>If you didn’t receive the password email, you can also set your password using the following link:</p>' +
                    '<p><a href="' + setPasswordLink + '">Set Your Password</a></p>' +
                    '<br/><p>Thanks,<br/>Support Team</p>'
                );
                email.setSaveAsActivity(false);
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });

            } catch (Exception e) {
                throw new FlowException('User creation failed for ' + cust.Name + ': ' + e.getMessage());
            }
        }
    }

    public class FlowException extends Exception {}
}