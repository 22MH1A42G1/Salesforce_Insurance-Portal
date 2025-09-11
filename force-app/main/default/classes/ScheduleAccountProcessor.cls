public class ScheduleAccountProcessor implements schedulable {
public void execute(SchedulableContext sc)
{
    database.executebatch(new AccountProcessor(),50);
    
    // if you want to execute schedule apex
    // two ways---point click tool and cron expression
}
}