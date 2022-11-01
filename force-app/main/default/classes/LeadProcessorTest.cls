@isTest
public with sharing class LeadProcessorTest {
    @isTest
    public static void testit() {
        List<Lead> L_list = new List<Lead>();

        for (integer i=0; i<200; i++) {
            Lead L = new Lead();
            L.LastName = 'name';
            L.Company = 'Company';
            L.Status = 'Random Status';
            L_list.add(L);   
        }
        insert L_list;

        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        id batchId = Database.executeBatch(lp);
        Test.stopTest();
    }
}
// @isTest
// public  class LeadProcessorTest {
//     @testTest
//     static void setup() {
//         List<Lead> listLead = new List<Lead>();

//         for(Integer i=0; i <200; i++){
//             Lead Ld = new Lead();
//             Ld.FirstName = 'FirstName' +i;
//            	Ld.LeadSource = 'Web' +i;
//             listLead.add(Ld);
//         }
//           insert listLead;
        
//         Test.startTest();
//         LeadProcessor ls = new LeadProcessor();
//         Database.executeBatch(ls,200);
//         Test.stopTest();
        
//         list<Lead> result = [select Id, LeadSource from Lead];
//         system.assert(result[0].LeadSource.contains('Web'));
//     }
// }
