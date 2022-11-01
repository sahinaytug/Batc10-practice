public class Calculator {
    public void printNewMessage(string msg){
        //this is INSU=IDE OF THE METHOD
        //WE USE MSG (VARIABLE NAME OF PARAMETERER HERE)
        system.debug(msg);
    }

    //starting string return type

    public string printAndReturnMessage(string msg){
        string returnStr = msg + '...Ok cool';
        return returnStr;
    }

    
    public integer add(integer a, integer b){
        system.debug('inside add method with 3 params');
    integer sum = a + b;
    //to return anything use return keyword 
    return sum;
    }

   
}
