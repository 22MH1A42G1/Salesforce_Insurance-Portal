global class ResetPaymentStatusScheduler implements Schedulable {
    global void execute(SchedulableContext sc) {
        Date today = Date.today();
        Integer currentMonth = today.month();
        Integer currentYear = today.year();

        List<Payment__c> updates = new List<Payment__c>();

        List<Payment__c> payments = [
            SELECT Id, Payment_status__c, LastModifiedDate
            FROM Payment__c
            WHERE Payment_status__c = 'Completed'
        ];

        for (Payment__c p : payments) {
            Date lastModified = p.LastModifiedDate.date();

            if (
                lastModified.year() < currentYear ||
                (lastModified.year() == currentYear && lastModified.month() < currentMonth)
            ) {
                p.Payment_status__c = 'Pending';
                p.Description__c='The payment is not completed for this month';
                updates.add(p);
            }
        }

        if (!updates.isEmpty()) {
            update updates;
        }
    }
}