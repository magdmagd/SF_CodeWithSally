public class AccountTriggerHandler
{
  
       /** Public Handlers **/
     public static void handleBeforeInsert(List<Account> lstNewAccts)
     {
            setDefaultValues(lstNewAccts);
            validateErrors(lstNewAccts);
     }//end handleBeforeInsert()

     public static void handleBeforeUpdate(List<Account> lstAccts)
     {
      
     }//end handleBeforeUpdate


     public static void handleAfterUndelete(List<Account> lstAccts )
     {
       List<Task> lstTasks = new List<Task>();
       Task tsk ;
          for(Account acc : lstAccts)
            {
                tsk =  createTask(acc , 'undelete');
                lstTasks.add(tsk);
            }//end for 
          
            insert lstTasks ;
     }//end handleAfterUndelete()

     public static void handleAfterInsert(List<Account> lstAccts)
     {
       List<Task> lstTasks = new List<Task>();
       Task tsk ;
        for(Account acc : lstAccts)
            {
                tsk =  createTask(acc , 'insrert');
                lstTasks.add(tsk);
            }//end for 
         
         insert lstTasks ;   

     }//end handleAfterInsert()

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


     private static Task createTask(Account acc , String state)
     {
        Task reviewTask;
        switch on state{
          when 'undelete'
        //if(state == 'undelete')
         {
             reviewTask = new Task(
               OwnerId = acc.OwnerId,
                WhatId = acc.Id,
                Subject = 'Review undeleted Account',
                Description = 'The Account has been restored. Please review the details.',
                Priority = 'High',
                Status = 'Not Started');
          }//end       
        // else if(state == 'insert')
         when 'insert'
         {
         reviewTask = new Task(	
                    Subject = 'Welcome to Salesforce!',
                    Description = 'The Account has been Inserted ',
                    WhatId = acc.Id,
                    OwnerId = acc.OwnerId,
                    Status = 'Not Started',
                    Priority = 'Normal');            
         }//end if 
         when 'update'
         {
             reviewTask = new Task(
               OwnerId = acc.OwnerId,
                WhatId = acc.Id,
                Subject = 'Review Account High Vale',
                Description = 'Annual Revenue exceeded Amount , Review account details',
                Priority = 'High',
                Status = 'Not Started');
         }//end 'update'
        }//end switch 
         return reviewTask ;       
     }//end createTask(Account acc)

     private static void validateUpdate()
     {

     }


}//end class