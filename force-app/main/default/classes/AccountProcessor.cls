public with sharing class AccountProcessor {
    @future
    public static void countContacts(Set<Id> setId){
        List<Account> lstAccount =  [SELECT Id, Number_Of_Contacts__c,(SELECT Id FROM CONTACTS) FROM Account WHERE 
        Id in :setId];
        for (Account  acct : lstAccount) {
            List<Contact> lstCont = acct.Contacts;
            acct.Number_Of_Contacts__c = lstCont.size();   
        }
        update lstAccount;
    }
}
