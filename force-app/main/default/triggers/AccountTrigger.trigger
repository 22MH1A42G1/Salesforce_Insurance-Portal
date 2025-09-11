trigger AccountTrigger on Account (after update) {
if(trigger.isUpdate && trigger.isAfter)
{
    set<id> idslist=new set<id>();
    for(account acc:trigger.new)
    {
        if(acc.rating=='Hot')
        {
            idslist.add(acc.id);
        }
    }
    if(!idslist.isempty())
    {
       FutureMethods.updateaccount(idslist);
    }
}
}