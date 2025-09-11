public class UpdateCont {
public static void method1()
{
    contact con=new contact();
    try
    {
      insert con; 
        throw new UpdatingContaException('the record created successfully');
    }
    catch(exception e)
    {
       throw new UpdatingContaException('there is an error creating the record because that is not yer initialized'); 
    }
}
}