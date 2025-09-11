public without sharing class CustomerPolicyController {
    @AuraEnabled(cacheable=true)
    public static List<Customer_Policy__c> getMyPolicies() {
        // Get current user's name and email
        User currentUser = [SELECT Name, Email FROM User WHERE Id = :UserInfo.getUserId()];
        
        // Find the matching Customer__c based on Name and Email
        List<Customer__c> customers = [
            SELECT Id
            FROM Customer__c
            WHERE Name = :currentUser.Name
              AND Email__c = :currentUser.Email
            LIMIT 1
        ];

        if (customers.isEmpty()) {
            return new List<Customer_Policy__c>();
        }

        Id customerId = customers[0].Id;

        // Fetch related Customer_Policy__c records with Policy details
        return [
            SELECT Id, Name,
                   Policy__r.Id, Policy__r.Name, Policy__r.Policy_Type__c,Policy__r.Premium_Amount__c, 
                   Policy__r.Coverage_Amount__c, Policy__r.Terms_Duration__c, (SELECT Id, Due_Date__c, Payment_status__c FROM Payments__r)
            FROM Customer_Policy__c
            WHERE Customer__c = :customerId
        ];
    }
}
