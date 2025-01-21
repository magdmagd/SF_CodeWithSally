public class SimpleSOSLQuery 
{
 
    public List<sObject> getAccountsAndContacts(String searchTerm) 
    {
        searchTerm = 'Forbes';
        // Add wildcard characters for partial matching
        String searchExpression = '%' + String.escapeSingleQuotes(searchTerm) + '%';

        // Perform the SOSL query
        List<List<sObject>> searchResults =
         [
            FIND :searchExpression
            IN ALL FIELDS
            RETURNING
                Account (Id, Name),
                Contact (Id, FirstName, LastName, Email)
         ];

        // Combine Account and Contact results into a single list
        List<sObject> combinedResults = new List<sObject>();

        if (!searchResults.isEmpty()) 
        {
            // Add Account results
            combinedResults.addAll((List<sObject>) searchResults[0]);

            // Add Contact results
            combinedResults.addAll((List<sObject>) searchResults[1]);
        }//end if 

        return combinedResults;
    }//end getAccountsAndContacts





}//end SimpleSOSLQuery