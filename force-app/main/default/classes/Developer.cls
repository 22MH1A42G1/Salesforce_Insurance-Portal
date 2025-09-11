public class Developer extends Employee {
public string progLang;
    public Developer(string name, long epid, string language){
         super(name,epid);
    this.progLang=language;
    }
   
    public override void showRole()
    {
        system.debug(empName+'is skilledin:'+progLang);
    }
}