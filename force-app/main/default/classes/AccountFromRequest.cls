@RestResource(urlMapping='/CreateAccountFromRequest/*')
global with sharing class AccountFromRequest {

    @HttpPost
    global static String createAccount() {
        // Get the incoming request
        RestRequest request = RestContext.request;

        // Read the raw JSON body
        String requestBody = request.requestBody.toString();

        // Parse the JSON string into a Map
        Map<String, Object> accData = (Map<String, Object>)JSON.deserializeUntyped(requestBody);

        // Create Account record
        Account acc = new Account();
        acc.Name = (String) accData.get('Name');
        acc.Phone = (String) accData.get('Phone');
        acc.Industry = (String) accData.get('Industry');

        // Insert into database
        insert acc;

        // Return confirmation message
        return 'Account Created with Id: ' + acc.Id;
    }
}