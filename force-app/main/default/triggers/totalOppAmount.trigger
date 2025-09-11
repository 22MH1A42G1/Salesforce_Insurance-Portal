trigger totalOppAmount on Opportunity (After insert,after update) {
if(trigger.isAfter && trigger.isInsert)
{
    InserOppAmount.insertAmount(Trigger.new);
}
    if(trigger.isAfter && trigger.isUpdate)
{
    
}
}