public class QueueApex implements queueable {
public void execute(QueueableContext q)
{
    // scenario---update the contacts whose title is blank to customer;
    list<contact> conlist=new list<contact>();
    list<contact> contactlist=[select id,firstname,lastname,title from contact where title=null];
    for(contact con:contactlist)
    {
        con.Title='Customer';
        conlist.add(con);
    }
    update conlist;
}
}