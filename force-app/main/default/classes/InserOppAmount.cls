public class InserOppAmount {
    public static void insertAmount(List<Opportunity> oppList) {
        Set<Id> accountIds = new Set<Id>();
        Map<Id, Decimal> totalAmount = new Map<Id, Decimal>();
        List<Account> accList = new List<Account>();

        // Collect Account Ids from Opportunities
        for (Opportunity opp : oppList) {
            if (opp.AccountId != null) {
                accountIds.add(opp.AccountId);
            }
        }

        // Aggregate Opportunity Amounts by AccountId
        for (AggregateResult ar : [
            SELECT AccountId, SUM(Amount) amt
            FROM Opportunity
            WHERE AccountId IN :accountIds
            GROUP BY AccountId
        ]) {
            Id accId = (Id)ar.get('AccountId');
            Decimal amt = (Decimal)ar.get('amt');
            totalAmount.put(accId, amt);
        }

        // Update Account's AnnualRevenue with total Opportunity Amount
        for (Account acc : [SELECT Id, Name, AnnualRevenue FROM Account WHERE Id IN :accountIds]) {
            if (totalAmount.containsKey(acc.Id)) {
                acc.AnnualRevenue = totalAmount.get(acc.Id);
                accList.add(acc);
            }
        }

        if (!accList.isEmpty()) {
            update accList;
        }
    }
}