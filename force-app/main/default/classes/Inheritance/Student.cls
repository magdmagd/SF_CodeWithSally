public class Student extends Person
{
    public String School ;


    public Student(String name ,Integer age , String School)
    {
               super(name , age);    
               this.School =School;
    }//end constructor 


    public void displayAllDetails()
    {
        System.debug('Name :' + name +'age :' +age + 'School :' + School);

    }//end 

    

}// end class 