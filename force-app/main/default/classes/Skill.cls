public class Skill {
public string skillname;
    public integer noofExp;
    
    public Skill(string skname,integer years)
    {
      this.skillname=skname;
        this.noofExp=years;
    }
   public void showSkill() {
        System.debug('Skill: ' + skillname + ', Experience: ' + noofExp + ' years');
    }
}