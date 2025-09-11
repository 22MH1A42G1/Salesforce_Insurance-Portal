public class UpdateContactPhone {
public static void updateContactrecord()
{
    // to update the updated contact phone number
    list<contact> updateContactlist=new list<contact>();
    // fetch all the records from the database where the phone is not null
    list<contact> contactList=[select phone from contact where phone!=null];
    // iterate ove the collections
    for(contact con:contactList)
    {
      con.Phone='8888888888';
       updateContactlist.add(con); 
      
    }
  try
  {
      // trying update the records using the collections
      update updateContactlist;
  }
    catch(DMLexception e)
    {
        system.debug('there is an error'+e.getmessage());
        system.debug('Line number'+e.getLineNumber());
        system.debug('The cause is '+e.getCause());
    }
    finally{
        system.debug('the failure and the success is handleed');
    }
}
}