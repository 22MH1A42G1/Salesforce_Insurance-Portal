public class CloseProspectOpportunitiesBatch implements Database.Batchable<SObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Name, LastModifiedDate ' +
            'FROM Opportunity ' +
            'WHERE StageName = \'Prospecting\' ' +
            'AND LastModifiedDate=LAST_N_MONTHS:6'
        );
    }

    public void execute(Database.BatchableContext bc, List<Opportunity> oppList) {
        for (Opportunity opp : oppList) {
            opp.StageName = 'Closed Lost'; // Or any other logic
        }
        update oppList;
    }

    public void finish(Database.BatchableContext bc) {
        System.debug('Batch completed');
    }
}