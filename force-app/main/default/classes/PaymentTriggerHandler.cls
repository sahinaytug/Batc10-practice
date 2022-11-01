public class PaymentTriggerHandler {
    public static void updateTotalAmountOnPaymentdelete(List<Paymentts__c> Triggerold){
        Set<Id> customerIds = new Set<Id>();
        for( Paymentts__c pay : triggerOld){
                customerIds.add(pay.Customerr__c);
            
        }
        if (!customerIds.isEmpty()) {
            updateTotalAmount(customerIds);    
        }
    }
    public static void updateTotalAmountOnPaymentInsert(List<Paymentts__c> Triggernew){
        Set<Id> customerIds = new Set<Id>();
        for( Paymentts__c pay : triggerNew){
            if(pay.Amount__c != null){
                customerIds.add(pay.Customerr__c);
            }
        }
        if (!customerIds.isEmpty()) {
            updateTotalAmount(customerIds);
            
        }
    }
    public static void updateTotalAmountOnPaymentUpdate(List<Paymentts__c> Triggernew , map<id, Paymentts__c> triggerOldMap){
        Set<Id> customerIds = new Set<Id>();
        for( Paymentts__c pay : triggerNew){
//pay.Amount__c != null
            if(pay.Amount__c != triggerOldMap.get(pay.Id).Amount__c || pay.Customerr__c != triggerOldMap.get(pay.Id).Customerr__c ){
                if(pay.Amount__c != null){
                    //yeni customers
                    customerIds.add(pay.Customerr__c);
                    //eski customers
                    customerIds.add(triggerOldMap.get(pay.Id).Customerr__c);
                }

            }
        }
        if (!customerIds.isEmpty()) {
            updateTotalAmount(customerIds);
            
        }
    }

    public static void updateTotalAmount(Set<Id> customerIds) {
        List<Customerr__c> customerLIst = [Select id, Total_Amount__c ,(SELECT id, Amount__c from Paymentts__r) FROM Customerr__c where Id IN :customerIds];

        List<Customerr__c> updateCustumerList = new List<Customerr__c>();

        for (customerr__c cust : customerLIst) {
            decimal totalAmount = 0;
            for (Paymentts__c payment : cust.Paymentts__r) {
                if (payment.Amount__c != null) {
                    totalAmount += payment.Amount__c;
                }

                //totalAmount = totalAmount + payment.Amount__c;
            }
            cust.Total_Amount__c = totalAmount;
            updateCustumerList.add(cust);
            
        }
        if(!updateCustumerList.isEmpty()){
            update updateCustumerList;
        }
        
    }
}
