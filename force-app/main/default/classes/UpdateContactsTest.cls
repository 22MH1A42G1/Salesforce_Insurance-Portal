@isTest
public class UpdateContactsTest {
@isTest
    public static void getContacts()
    {
        TestDataFactory.insertRecords(10);
        test.starttest();
        UpdateContacts.main();
        test.stoptest();
        list<contact> conlist=[select id,name,leadsource from contact];
      system.assertEquals('Web',conlist[0].leadsource);
        
    }
}