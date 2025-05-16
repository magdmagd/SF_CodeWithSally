public class AccountTriggerHandler
{
  
       /** Public Handlers **/
     public static void handleBeforeInsert(List<Account> lstNewAccts)
     {
            setDefaultValues(lstNewAccts);
            validateErrors(lstNewAccts);
     }//end handleBeforeInsert()



       /** Private Methods **/
     private static void setDefaultValues(List<Account> lstAccts)
     {
        for(Account acctObj:lstAccts)
          {
            if (String.isBlank(acctObj.Industry)) 
            {
                acctObj.Industry = 'Technology';
            }//end if 
          }//end for
     }//end setDefaultValues

     private static void validateErrors(List<Account> lstAccts)
     {
        for(Account acctObj:lstAccts)
          {
            if (String.isBlank(acctObj.phone)) 
            {
                acctObj.addError('Please enter phone number');
            }//end if              
          }//end for  

     }//end validateErrors


}//end class