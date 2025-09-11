public class AccountProcessor implements database.batchable<sObject> {
    public database.querylocator start(database.batchableContext bc){
        return database.getquerylocator('select id, name, industry from account where industry=null');
    }
    
    public void execute(database.batchableContext bc, list<account> scope){
        for(account acc: scope){
            acc.Industry = 'Technology';
        }
        update scope;
    }
    
    public void finish(database.batchableContext bc){
        system.debug('This batch process has been completed successfully!');
    }
}