trigger preventDuplicateEmail on Contact (before insert) {
if(trigger.isinsert)
{
    if(trigger.isbefore)
    {
        set<string> emails=new set<string>();
        for(contact con:trigger.new)
        {
            if(con.email!=null)
            {
                emails.add(con.email);
            }
        }
        // fetch old emails
       map<string,contact> oldConlist=new map<string,contact>();
        for(contact co:[select id,name,email from contact where email in :emails])
        {
            oldConlist.put(co.Email,co);
        }
       for(contact cont:trigger.new)
       {
          if(oldConlist.containskey(cont.email))
          {
              cont.adderror('Duplicate email');
          }
       }
    }
}
}