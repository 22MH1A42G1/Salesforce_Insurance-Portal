trigger CustomerPolicyTrigger on Customer_Policy__c (after insert) {
    // Get all Customer Ids from newly inserted policies
    Set<Id> customerIds = new Set<Id>();
    for (Customer_Policy__c cp : Trigger.new) {
        if (cp.Customer__c != null) {
            customerIds.add(cp.Customer__c);
        }
    }

    // Get all related Customers
    Map<Id, Customer__c> customerMap = new Map<Id, Customer__c>(
        [SELECT Id, Name FROM Customer__c WHERE Id IN :customerIds]
    );

    // Prepare list for updates
    List<Customer_Policy__c> updates = new List<Customer_Policy__c>();

    for (Customer_Policy__c cp : Trigger.new) {
        Customer__c cust = customerMap.get(cp.Customer__c);
        if (cust != null) {
            Customer_Policy__c updatedPolicy = new Customer_Policy__c(
                Id = cp.Id,
                Name = cp.Name+ ' - ' + cust.Name
            );
            updates.add(updatedPolicy);
        }
    }

    if (!updates.isEmpty()) {
        update updates;
    }
}