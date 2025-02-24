trigger AccountTriggerSwitch on Account (before insert , before update , after insert , after update , before delete , after undelete)
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
            //AccountTriggerHandler.handlebeforeDelete(Trigger.old, Trigger.oldMap);
         }

         
        when AFTER_INSERT 
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

        }//  when AFTER_INSERT 

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

        }//end  after_undelete
        when else
        {

        }//end else 
    } //end switch 
}//end AccountTriggerSwitch