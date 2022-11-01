trigger CustomerTrigger on Customerr__c (before insert, after insert, before delete, after delete) {
        if (Trigger.isAfter && Trigger.isInsert) {
            CustomerTriggerHandler.CreatePaymentAutomatiacily(trigger.new);
        }
        // if (Trigger.isBefore && Trigger.isDelete){
        //     CustomerTriggerHandler.deletePayment(trigger.old);
        // }
    }