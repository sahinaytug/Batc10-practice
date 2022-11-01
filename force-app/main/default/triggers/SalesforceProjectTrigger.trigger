trigger SalesforceProjectTrigger on Salesforce_Project__c (before update, before insert, 
    after insert, after update) {

   system.debug('====START====');
    if (trigger.isBefore && trigger.isInsert){
        System.debug(' Salesforce_Project__c before insert trigger called yeahhh');
    //True when code is running is Update Context
    }
    if(trigger.isAfter && trigger.isInsert){
    System.debug('Salesforce_Project__c  after insert trigger called ooh yeahh');

    }  
    
    if(trigger.isBefore && trigger.isUpdate){
        System.debug('Salesforce_Project__c before update trigger called ooh yeahh');
    
        }
        if(trigger.isAfter && trigger.isUpdate){
        System.debug('Salesforce_Project__c after update trigger called ooh yeahh');
    
        }
        system.debug('====END====');
}
// Create a trigger on Salesforce_Project__c
// Trigger should work on before update, before insert, after insert, after 
// update.
// Add multiple if conditions using context variable for insert, update, 
// before and after and add system.debug() statement under every 
// condition.
// Try Creating New record for Salesforce_Project__c object. You should be 
// able to see logs for before insert and after Insert.
// Try Updating existing record for Salesforce_Project__c object. You 
