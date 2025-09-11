
public with sharing class accountcreate {
    @auraenabled
    public static void accountcreation(string firstname, string phonenumber, string emails)
    {
        account acc=new account();
        acc.name=firstname;
        acc.Phone=phonenumber;
        insert acc;
    }
    @AuraEnabled(cacheable=true)
    public static list<contact> getcontacts()
    {
        list<contact> conlist=[select firstname,lastname,phone,email from contact limit 10];
        return conlist;
    }
}
