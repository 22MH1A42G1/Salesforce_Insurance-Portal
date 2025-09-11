@isTest
global class AnimalCalloutMockFailure implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        throw new CalloutException('Simulated failure');
    }
}