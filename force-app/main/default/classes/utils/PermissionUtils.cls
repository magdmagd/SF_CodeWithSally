public class PermissionUtils 
{
    public static Boolean hasCreateAccess(String objectName)
    {
       // return sObjectType.getDescribe().isCreateable();
       return Schema.getGlobalDescribe().get(objectName).getDescribe().isCreateable();
    } // end hasCreateAccess 

    public static Boolean hasReadAccess(Schema.sObjectType sObjectType)
    {
        return sObjectType.getDescribe().isAccessible();
    } // end hasReadAccess 

    public static Boolean hasUpdateAccess(Schema.sObjectType sObjectType)
    {
        return sObjectType.getDescribe().isUpdateable();
    } // end hasUpdateAccess

    public static Boolean hasDeleteAccess(Schema.sObjectType sObjectType)
    {
        return sObjectType.getDescribe().isDeletable();
    } // end hasDeleteAccess
} // end PermissionUtils 