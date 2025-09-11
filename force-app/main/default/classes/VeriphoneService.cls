public class VeriphoneService {
    @future(callout=true)
    public static void verifyPhoneNumber(Id contactId, String phone) {
        // Fetch API key from custom metadata
        api_key_information__mdt config = [
            SELECT api_key__c FROM api_key_information__mdt
            WHERE DeveloperName = 'key_value'
            LIMIT 1
        ];

        String apiKey = config.api_key__c;
        String endpoint = 'callout:callout_to_veriphione/v2/verify?phone=' + phone + '&key=' + apiKey;

        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');

        Http http = new Http();
        try {
            HttpResponse res = http.send(req);
            System.debug('Response Body: ' + res.getBody());

            if (res.getStatusCode() == 200) {
                Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
                Boolean isValid = (Boolean) result.get('phone_valid');

                Contact c = [SELECT Id FROM Contact WHERE Id = :contactId];
                
                // Traditional if-else approach
                if (isValid == true) {
                    c.Phone_Verification__c = 'Valid';
                } else {
                    c.Phone_Verification__c = 'Invalid';
                }

                update c;
                System.debug('Updated contact: ' + c.Id + ', Phone Verification: ' + c.Phone_Verification__c);
            } else {
                System.debug('HTTP Error: ' + res.getStatus());
            }
        } catch (Exception e) {
            System.debug('Callout Exception: ' + e.getMessage());
        }
    }
}