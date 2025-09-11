public class UpdateContacts {
public static void main()
{
    list<contact> contacts=new list<contact>();
    list<contact> conlist=[select id,name,leadsource from contact];
    
    for(contact con:conlist)
    {
      con.leadsource='Web';
        contacts.add(con);
    }
    try
    {
        update contacts;
    }
    catch(exception e)
    {
        system.debug('the record did not get updated'+e.getmessage());
    }
}
}