public class ContactTriggerHandler
{
    public static void handleBeforeInsert(List<Contact> lstNewAccts)
    {
       validateErrors(lstNewAccts);
    }//end handleBeforeInsert

    public static void handleBeforeUpdate(List<Contact> lstNewAccts)
    {
      validateErrors(lstNewAccts);
    }//end handleBeforeUpdate

    public static void handleAfterInsert(List<Contact> lstNewAccts)
    {
         List<Task> lstTasks = new List<Task>();
         Task tsk ;
         for(Contact con : lstNewAccts)
          {
            tsk = createTask(con , 'Welcome to Salesforce!','Normal');
            lstTasks.add(tsk);
          }//end for 

          insert lstTasks ;
    }//end handleAfterInsert

   /********************* Private Methods ************************/

   private static void validateErrors (List<Contact> lstAccts)
   {
     for(Contact ct: lstAccts)
       {
         if(String.isEmpty(ct.FirstName))
         {
            ct.addError('First Name is Required');
         }//end if 
         else if(String.isEmpty(ct.LastName))
         {
            ct.addError('Last Name is Required');
         }//end if 
       }//end for 
   }//end validateErrors


  private static Task createTask(Contact con , String sub , String pri)
  {
     Task reviewTask ;
     reviewTask =new Task(Subject=sub ,
                          OwnerId = con.OwnerId ,
                          WhatId  = con.Id , 
                          Status  = 'Not Started',
                          Priority = pri ,
                          Description = 'Task created for'+sub);    
      return reviewTask ;
                           
   
  }//end createTask()




}//end ContactTriggerHandler