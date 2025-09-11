public with sharing class PolicyController {
    @AuraEnabled(cacheable=true)
public static List<Policy__c> getPolicy(){
    return[
        SELECT Name,Policy_Type__c, Coverage_Amount__c, Premium_Amount__c,Terms_Duration__c,Description__c,Policy_Status__c
        FROM Policy__c WHERE Active__c=true
        ];
}
}