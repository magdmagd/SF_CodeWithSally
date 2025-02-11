trigger AccountTrigger on Account (before insert, before update, after insert, after update , before delete , after undelete) 
{
    if (Trigger.isBefore) 
    {
        if (Trigger.isInsert) 
        {
           for (Account accObj : Trigger.new)
           {
              if (String.isblank(accObj.Industry))
              {
                accObj.Industry = 'Technology';
              }//end if 
           }//end for
        }//end if insert  
        else if (Trigger.isUpdate) 
        {
           // AccountTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        }//end if update
        else if(Trigger.isDelete)
        {
            for(Account acc: Trigger.old)
            {
                            
                    if (acc.Industry == 'Technology') 
                    {
                        acc.addError('You cannot delete an account with Industry = Technology.');
                    }
           }//end for           
        }//end else if
    }//end if 
 else if (Trigger.isAfter)
    {
        if (Trigger.isInsert) 
        {
         List<Task> lstTasks = new List<Task>();
         for (Account acc: Trigger.new)
         {
            Task welcomeTask = new Task(
               OwnerId = acc.OwnerId,
                WhatId = acc.Id,
                Subject = 'Welcome To SF',
                Priority = 'Normal',
                IsReminderSet = true,
                ReminderDateTime = System.now()+1 ,
                Status = 'Not Started');
                lstTasks.add(welcomeTask);
         }//end for 
         insert lstTasks;
        }//end if insert 
        else if (Trigger.isUpdate)
       {
            //AccountTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
       }//end if update 
       else if(Trigger.isUnDelete)
       { 
         //Account TriggerHandler.handleUnDelete(Trigger.new,Trigger.oldMap);
      }
    }//end After 
}//end triiger 
