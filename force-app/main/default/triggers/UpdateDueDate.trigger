trigger UpdateDueDate on Payment__c (before update) {
if(trigger.isBefore && trigger.isUpdate)
{
    for (Payment__c payment : Trigger.new) {
        Payment__c oldPayment = Trigger.oldMap.get(payment.Id);

        // If status changed to Paid and Due Date is still in current month
        if (
            payment.Payment_status__c == 'Completed' &&
            oldPayment.Payment_status__c != 'Completed' &&
            payment.Due_Date__c.month() == Date.today().month() &&
            payment.Due_Date__c.year() == Date.today().year()
        ) {
            payment.Due_Date__c = payment.Due_Date__c.addMonths(1);
            payment.Description__c='The payment is completed for this month';
        }
}
}
}