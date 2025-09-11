public class DeleteAccountsCustomAction {
    @InvocableMethod(
        label='Delete Accounts by Name' 
        description='Deletes Account records based on given names'
    )
    public static List<String> deleteMethod(List<String> aNames) {
        List<String> deletedAccountIds = new List<String>();
        
        // Query all Accounts matching input names
        List<Account> accList = [SELECT Id, Name FROM Account WHERE Name IN :aNames];

        if (!accList.isEmpty()) {
            delete accList; // bulk delete
            for (Account acc : accList) {
                deletedAccountIds.add(acc.Id); // collect deleted IDs
            }
        }

        return deletedAccountIds;
    }
}