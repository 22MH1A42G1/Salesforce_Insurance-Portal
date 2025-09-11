@isTest
public class TestDataFactory {
public static void insertRecords()
{
    list<account> acclist=new list<account>();
    for(integer i=0;i<5;i++)
    {
        account acc=new account();
        acc.name='Pramod'+i;
        acc.phone='1234567890';
        acclist.add(acc);
    }
    insert acclist;
    list<contact> conlist=new list<contact>();
    for(integer k=0;k<3;k++)
    {
        account acc=acclist[k];
        contact con=new contact();
        con.lastname='limma'+k;
        con.phone=acc.phone;
        con.AccountId=acc.Id;
        conlist.add(con);
    }
     insert conlist;
    
}
}