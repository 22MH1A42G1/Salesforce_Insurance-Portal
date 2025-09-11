public class MydebugSampleclass {
public static void createAccount()
{
    system.debug('start account creation');
    account acc=new account();
    acc.name='Anisha';
    insert acc;
    system.debug('the record created'+acc.Id);
    system.debug('end of account creation');
}
}