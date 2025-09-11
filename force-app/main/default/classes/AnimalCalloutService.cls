public class AnimalCalloutService {
    public static void getAnimals() {
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
            request.setMethod('GET');

            HttpResponse response = http.send(request);

            if (response.getStatusCode() == 200) {
                // Parse response like: {"animals": ["Dog", "Cat", "Elephant"]}
                Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                List<Object> animals = (List<Object>) result.get('animals');

                for (Object a : animals) {
                    System.debug(a);
                }
            } else {
                System.debug('Callout failed. Status: ' + response.getStatusCode());
            }
        } catch (Exception e) {
            System.debug('Error: ' + e.getMessage());
        }
    }
}