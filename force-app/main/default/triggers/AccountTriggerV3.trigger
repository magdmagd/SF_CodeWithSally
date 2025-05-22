trigger AccountTriggerV3 on Account(before insert , before update , before delete , after insert , after update , after undelete)
{

    switch on Trigger.OperationType 
    { 
     when BEFORE_INSERT 
     {
       AccountTriggerHandler.handleBeforeInsert(Trigger.new);
     }//end BEFORE_INSERT

     when BEFORE_UPDATE
     {

     }//end BEFORE_UPDATE

     
     when BEFORE_DELETE
     {

     }//end BEFORE_DELETE

     when AFTER_INSERT
     {
      AccountTriggerHandler.handleAfterInsert(Trigger.new);
     }
     when AFTER_UPDATE
     {

     }
     when AFTER_UNDELETE
     {
       AccountTriggerHandler.handleAfterUndelete(Trigger.new);
     }
 }//end switch
}//end trigger AccountTriggerV3