trigger AccountPhoneTrigger on Account (after update) {
if(trigger.isUpdate && trigger.isAfter)
{
    AccountPhoneUpdate.updateAcountphone(trigger.new,trigger.oldmap);
}
}