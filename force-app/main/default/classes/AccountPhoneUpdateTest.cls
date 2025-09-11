@istest
public class AccountPhoneUpdateTest {
@istest
    public static void getAccouts()
    {
        list<account> accounts=new list<account>();
        TestDataFactory.insertRecords();
        list<account> acclist=[select id,name,phone from account];
        for(account acc:acclist)
        {
            acc.phone='9876543210';
            accounts.add(acc);
        }
        test.startTest();
        update accounts;
        test.stoptest();
        list<contact> conlist=[select id,name,phone from contact];
        for(contact con:conlist)
            {
                system.assertequals('9876543210',con.phone);
            }
    }
}