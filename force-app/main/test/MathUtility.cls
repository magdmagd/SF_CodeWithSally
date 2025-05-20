public class MathUtility 
{

    public static Integer addNumbers(List<Integer> lstNumbers)
    {
        Integer sum = 0 ;
        for(Integer numbervalue:lstNumbers)
        {
            sum+=numbervalue ;
        }//end for 

        System.System.debug('sum value :'+sum);

        return sum ;
    }//end addNumbers

    public static Integer addNumbers(Integer num1 , Integer num2)
    {
        return addNumbers(new List<Integer>{num1,Num2});
    }//end addNumbers


    public static decimal divideNumbers(decimal num1 , decimal num2)
    {
        if(num2==0)
          {
            throw new IllegalArgumentException('Cannot divide by zero');
          }
        
        return num1/num2 ;
    }//end divideNumbers

    public static Integer subtractNumbers(Integer num1 , Integer num2)
    {
               return num1-num2;
    }//end subtractNumbers

    public static Integer multiplyNumbers(Integer num1 , Integer num2)
    {
        return num1*num2 ;
    }//end multiplyNumbers


    
}//end class 