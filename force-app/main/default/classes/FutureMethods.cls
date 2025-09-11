public class FutureMethods {
    @future
public static void updateaccount(set<id> hotIds)
{
    list<account> updateaccounts=new list<account>();
   list<account> acclist=[select id,name,rating from account where id in :hotIds];
    for(account acc:acclist)
    {
        acc.description=' this account is very very hot, please dont touch it';
        updateaccounts.add(acc);
    }
    update updateaccounts;
}
}