public class UpdateAccountRecords {
public static void updatingAcc()
{
    list<account> accountstoBeUpdated=new list<account>();
   list<account> acclist=[select id,name,phone from account where phone!=null];
   for(account acc:acclist)
   {
       acc.phone='3693693693';
       accountstoBeUpdated.add(acc);
   }
    try
    {
        database.saveResult[] result=database.update(accountstoBeUpdated,false);
    }
    catch(exception e)
    {
        system.debug('there is an error');
    }
}
}