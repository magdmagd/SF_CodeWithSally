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

 }//end testDivision

@isTest
 static void testSubtraction()
 {
    Integer num1 = 8 ;
    Integer num2 = 3 ;

    Integer res = MathUtility.subtractNumbers(num1,num2);
   
     Assert.areEqual(5,res,'Subtraction result should have been 5!!');

 }//end testSubtraction()


 @isTest
 static void testMultiply()
 {
    Integer num1 = 3 ;
    Integer num2 = 3 ;

    Integer res = MathUtility.subtractNumbers(num1,num2);
   
     Assert.areEqual(9,res,'Multiply result should have been 5!!');

 }//end testMultiply()

 @isTest
 static void testDivideByZero()
 {

    Decimal num1 = 10 ;
    Decimal num2=  0 ;

    try 
    {
        Decimal res = MathUtility.divideNumbers(num1,num2);
        Assert.fail('Excepted an excption for division by Zero');
    } catch (Exception ex) 
    {
        Assert.areEqual('Cannot divide by zero', ex.getMessage(), 'Expected division by zero error message');
    }//end 
 }//end testDivideByZero()


}//end MathUtilityTest 