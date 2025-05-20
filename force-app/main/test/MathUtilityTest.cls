@isTest 
private class MathUtilityTest 
{
    @isTest 
    static void testAddition()
    {
    Integer num1 = 12 ;
    Integer num2 = 13 ;
        
    Integer res = MathUtility.addNumbers(num1,num2);

    Assert.areEqual(7,res,'Addition result should have been 25!!');
 }//end testAddition()


 @isTest 
 static void testDivision()
 {
    Decimal num1= 10.0 ;
    Decimal num2 = 5.0 ;

    Decimal res= MathUtility.divideNumbers(10,5);

     Assert.areEqual(2.0,res,'Addition result should have been 2!!');

 }
}//end MathUtilityTest 