public  class DmlDemo2 {
    public static void dmlInsertDemo_stndObj1(){
       Account acc = new account();
        //2. set fields
        acc.name = 'SoftInnovas';
        //3.set other fields
        acc.phone = '233455566';
        //4.insert
        insert acc;
    }
   public static void dmlInsertDemo_cstmObj1(){
    //1.new instance
    Salesforce_Project__c sp = new Salesforce_Project__c();
    sp.Project_Name__c = 'Teach DML to supper Batch 10';
    sp.Description__c = 'All are doing great';
    sp.Status__c = 'New';
    // Insert dml
    insert sp;
   }
   public static void dmlUpdateDemo(){
       Account acc = new account();
       acc.name = 'anything';
       System.debug('BEFORE INSERTING' + acc);
       insert acc;
       System.debug('AFTER INSERTING' + acc);

       //uptade account name
       acc.Name = 'Softinnovas';
       update acc;
       System.debug('AFTER upodating' + acc);

   }
   
   public static void dmlUpdateDemo2(){
    Account acc = [select id, name from account where Name = 'Sofinnovas' limit 1];

    //update name
    acc.Name = 'Sofinnovas Inc';
    acc.Phone = '5756454576';
    update acc;
   }
   
}
