public class SOSLQuery{
    public List<Account> getAccounts(String searchString) {

        searchString = '{Forbes}' ;
        // Define the SOSL query
        String searchQuery = 'FIND \'' + String.escapeSingleQuotes(searchString) + '\' IN ALL FIELDS RETURNING Account(Id, Name)';
        
        // Execute the SOSL query
        List<List<SObject>> searchResults = Search.query(searchQuery);
        
        // Extract the Account results from the searchResults
        List<Account> accounts = (List<Account>)searchResults[0];
        
        return accounts;
    }//end class 
}
