trigger PreventDuplicateEmailOnContact on Contact (before insert,before update) {
// prevent duplicate email on the contact obkect
if(trigger.isBefore && trigger.isinsert || trigger.isBefore && trigger.isUpdate)
{
   set<string> newEmailsList=new set<string>(); 
   for(contact con:trigger.new)//list collection
   {
       if(con.email!=trigger.oldmap.get(con.id).email)
       {
            newEmailsList.add(con.Email);
       }
      
   }
    //store all the old emails in the set
    set<string> oldemail=new set<string>();
    
   //collect old recods
   list<contact> conlist=[select id,lastname,email from contact where email in :newEmailsList];
    
    for(contact co:conlist)
    {
        oldemail.add(co.Email);
    }
    for(contact cont:trigger.new)
    {
        if(oldemail.contains(cont.email))
        {
            cont.adderror('this is duplicate record');
        }
    }
    
}
}