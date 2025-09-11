public class AccountPhoneUpdate {
public static void updateAcountphone(list<account> acclist,map<id,account> oldAcclist)
{
    list<contact> conlist=new list<contact>();
    set<id> ids=new set<id>();
    for(account acc:acclist)
    {
        string phone=acc.phone;
        string oldphone=oldAcclist.get(acc.id).phone;
        if(phone!=oldphone)
        {
          ids.add(acc.id);  
        }
    }
   for(account ac:[select id,name,phone,(select id,name,phone from contacts) from account where id in :ids]) 
       
   {
       for(contact con:ac.contacts){
           con.phone=ac.phone;
           conlist.add(con);
       }
   }
    update conlist;
}
}