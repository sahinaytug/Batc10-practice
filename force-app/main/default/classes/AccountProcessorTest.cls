@isTest
public class AccountProcessorTest {
    public static testmethod void TestAccountProcessorTest() {
        Account a = new Account();
        a.Name = 'TestAccount';
        Insert a;

        Contact cont = new Contact();
        cont.FirstName = 'JJ';
        cont.LastName = 'Hello';
        cont.AccountId = a.Id;
        Insert cont;

        Set<Id> setAccId = new Set<Id>();
        setAccId.add(a.Id);

        Test.startTest();
        AccountProcessor.countContacts(setAccId);
        Test.stopTest();

        Account Acc = [SELECT Number_Of_Contacts__c FROM Account WHERE Id = :a.Id LIMIT 1];
        System.assertEquals(Integer.valueOf(Acc.Number_Of_Contacts__c), 1);

    }
}
