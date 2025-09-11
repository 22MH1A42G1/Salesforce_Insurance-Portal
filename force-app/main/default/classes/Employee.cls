public abstract class Employee {
public string empName;
    public long empID;
    public static integer empCount=0;
    
   public Employee(string name,long eid)
   {
       this.empName=name;
       this.empID=eid;
       empCount++;
   }
    public void showresult()
    {
        system.debug('Employee '+empName+'ID'+empID);
    }
     public abstract void showRole();
}