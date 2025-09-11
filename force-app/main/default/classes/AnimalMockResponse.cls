@isTest
global class AnimalMockResponse implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest req) {
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"animals": ["Dog", "Cat", "Elephant"]}');
        return res;
    }
}