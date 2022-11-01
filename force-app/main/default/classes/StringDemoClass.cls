public class StringDemoClass {
    public class primitiveDataTypeDemo2 {
        public void printNewDate(){
            System.debug('create new date instances');//this is integers
            Date newDate1=Date.newInstance(1995,3,24);//it takes 3 parameters or arguments year,months,date
            System.debug('newDate1-->'+newDate1);
            Date newDate2=Date.newInstance(2021,8,30);
            System.debug('newDate2-->'+newDate2);
            Date todayDate=date.today();
            System.debug('today\'s date-->'+ todayDate);
            }
     public void printNewTime(){//hour,minute,second,millisecond
        Time myTime=time.newInstance(3,56,7,30);
        Time myTime2=time.newInstance(5,20,7,24);
        System.debug('mytime:'+myTime);
        System.debug('my time:'+myTime2);
    }
    public void printNewDateTime(){
        Date todayDate=date.today();
        time myTime=time.newInstance(3,2,34,45);
        //1.new date time using date and time
        Datetime dt1=datetime.newInstance(todayDate,myTime);
        System.debug('dt1-->'+dt1);
        //2.this is going to show midnight
        Datetime dt2=datetime.newInstance(2025,9,13);//it takes midnight for our users time zone pasific time zone-7
        System.debug('Date time 2 is'+dt2);//but it prints GMT.+7 of pasific
        //3.new date time year month day hour min sec
        Datetime dt3=datetime.newInstance(2022,4,15,8,8,8);
        System.debug('Date time 3 is'+dt3);
        //4. new date jan 1 1970 00:00:00 GMT den beri
        Long longTime1=0;
        DateTime dt4=DateTime.newInstance(longtime1);
        Long LongTime2=3546272567782L;
        DateTime dt5=DateTime.newInstance(longtime2);
        System.debug('dt4-->'+dt4);
        System.debug('dt5-->'+dt5);
        //5.create directlyy in GMT
        DateTime dt6=DateTime.newInstanceGMT(2022,4,15,8,8,8);
        System.debug('dt6-->'+dt6);
        //6.now
        DateTime dt7=DateTime.now();
        System.debug('date time now-->'+dt7);
        }
    }
}



