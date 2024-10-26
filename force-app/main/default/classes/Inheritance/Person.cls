public virtual class Person
{
    public String name;
    public Integer age ;


    public Person(String name ,Integer age)
    {
        this.name = name ;
        this.age = age ;
    }//end constructor 



    public void displayDetails()
    {
        System.debug('Name :' + name +'age :' +age);

    }//end 

}//end class person