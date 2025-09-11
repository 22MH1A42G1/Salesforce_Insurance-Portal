public class WashingMachine {
public void wash()
{
    system.debug('Clothes washing......');
}
    public void Rinse()
{
    system.debug('Clothes Rinsing......');
}
    public string drain()
{
    return 'Water draining......';
}
    public void pressButton(string button)
    {
        if(button=='Wash')
        {
            wash();
        }
        else if(button=='Rinse')
        {
            Rinse();
        }
        else if(button=='Drain'){
          string msg=drain();
            system.debug(msg);
        }
        else
        {
          system.debug('invalid button');
        }
    }
}