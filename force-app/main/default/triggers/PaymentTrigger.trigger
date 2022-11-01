trigger PaymentTrigger on Paymentts__c (after insert, after update, after Delete) {
    if (trigger.isAfter) {
        if (trigger.isInsert) {
            PaymentTriggerHandler.updateTotalAmountOnPaymentInsert(Trigger.new);
        }
        if (trigger.isUpdate) {
            PaymentTriggerHandler.updateTotalAmountOnPaymentUpdate(trigger.new, trigger.oldMap);
        }
        if (trigger.isDelete) {
            PaymentTriggerHandler.updateTotalAmountOnPaymentdelete(Trigger.old);
        }
    }


}