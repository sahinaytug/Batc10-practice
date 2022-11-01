public  class DateMethodsClass {
    public boolean leapYearCheck(Date dt){
        system.debug('dt ====>' + dt);
        integer yr = dt.year();
        system.debug('year from dt ===>' + yr);
        boolean lp = date.isLeapYear(yr);
        return lp;
    }
    

 
}
