trigger AccountTriggerV2 on Account (before insert , before update , before delete ,after insert , after update  , after undelete)
{
    switch on Trigger.OperationType 
    {
        when BEFORE_INSERT 
        {
            for(Account acc : Trigger.new)
            {
                if(String.isblank(acc.Phone))
                {
                    acc.addError('Please enter phone number');
                }
                else if(string.isblank(acc.Industry))
                {
                    acc.Industry = 'Technology';                   
                }
            }//end for))
        }// end before insert

        when BEFORE_UPDATE 
         {
            for(Account acc :Trigger.new)
            {
                Account oldAcc = Trigger.oldMap.get(acc.Id);
                if(acc.annualRevenue != oldAcc.annualRevenue && acc.annualRevenue < 5000 )
                {
                    acc.addError('Annual Revenue Cannot be reduced < 5000');
                } //end if 
            }//end for                  

         }//end for update 

         when Before_delete 
         {
            List<Account> lstAccounts=[Select id,(Select Id from Opportunities) From Account where ID in : Trigger.oldMap.keyset()];
             for(Account accountObj : lstAccounts)
                { 
                if(!accountObj.Opportunities.isEmpty())
                accountObj.addError('You cannot delete this Account because it has associated Opportunities.');
                 }//end for
         }//end Before_delete 

                
                
         
when AFTER_INSERT 
      {      
       if(PermissionUtils.hasCreateAccess('Task')) 
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
    } 
  else 
     {
      System.debug('User does not have create access for Task.');
     }//end else
    
}//when AFTER_INSERT 

        when after_update
        {
            List<Task> lstTasks = new List<Task>();
            for(Account acc : Trigger.new)
            {
                Account oldAcc = Trigger.oldMap.get(acc.Id);
                if(acc.annualRevenue != oldAcc.AnnualRevenue && acc.AnnualRevenue > 10000 && oldAcc.AnnualRevenue < 10000)
                {
                    Task reviewTask = new Task(
                        Subject = 'Review High Value ',
                        WhatId = acc.Id,
                        OwnerId = acc.OwnerId,
                        Status = 'Not Started',
                        Priority = 'High',
                        Description = 'Annual Revenue exceeded $10,000,000. Review account details.'
                    );
                    lstTasks.add(reviewTask);                    

                }//end if 
           } //end for 
           insert lstTasks;
        }//end after_update  
        
        when after_undelete
        {
         List<Task> lstTasks = new List<Task>();
         for (Account acc: Trigger.new)
         {
            Task reviewTask = new Task(
               OwnerId = acc.OwnerId,
                WhatId = acc.Id,
                Subject = 'Review undeleted Account',
                Description = 'The Account has been restored. Please review the details.',
                Priority = 'High',
                Status = 'Not Started');
                lstTasks.add(reviewTask);
         }//end for 

         insert lstTasks;

        }//end  after_undelete
       
    } //end switch 
}//end AccountTriggerSwitch