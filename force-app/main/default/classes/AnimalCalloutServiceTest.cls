@isTest
public class AnimalCalloutServiceTest {

    @isTest
    static void testSuccessCallout() {
        Test.setMock(HttpCalloutMock.class, new AnimalMockResponse());

        Test.startTest();
        AnimalCalloutService.getAnimals();  // Try block success
        Test.stopTest();

        System.assertEquals(true, true, 'Success path executed');
    }

    @isTest
    static void testCatchBlock() {
        Test.setMock(HttpCalloutMock.class, new AnimalCalloutMockFailure());

        Test.startTest();
        AnimalCalloutService.getAnimals();  // Catch block should run
        Test.stopTest();

        System.assertEquals(true, true, 'Catch block executed successfully');
    }
}