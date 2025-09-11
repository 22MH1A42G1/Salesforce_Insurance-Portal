public class LoggingMediumLevel {
    public static void createAccount(string accName){
        try{
           system.debug('account creation started');
            if(string.isBlank(accName))
            {
                throw new MyException('account name is manditory');
            }
            account acc=new account(Name=accName);
            insert acc;
            system.debug('the account record got created successfully'+acc.Id);
        }catch(exception e)
        {
            system.debug(LoggingLevel.Error,'there is an error'+e.getmessage());
        }
        finally
        {
            system.debug('the account creation ended');
        }
    }
}