public class ContactTriggerHandler
{
    public static void handleBeforeInsert(List<Contact> lstNewAccts)
    {
       validateErrors(lstNewAccts);
    }//end handleBeforeInsert

    public static void handleBeforeUpdate(List<Contact> lstNewAccts)
    {

    }//end handleBeforeUpdate

   /********************* Private Methods ************************/

   private static void validateErrors (List<Contact> lstAccts)
   {
     for(Contact ct: lstAccts)
       {
         if(String.isEmpty(ct.FirstName))
         {
            ct.addError('First Name is Required');
         }//end if 
       }//end for 
   }//end validateErrors





}//end ContactTriggerHandler