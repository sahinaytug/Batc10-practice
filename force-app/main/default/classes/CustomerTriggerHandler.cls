public  class CustomerTriggerHandler {
    public static void CreatePaymentAutomatiacily (List<Customerr__c> trgNew ){
        List<Paymentts__c> paylist = new List<Paymentts__c>();

        for (customerr__c eachCust : trgNew) {

            Paymentts__c payOnline = new Paymentts__c();
            payOnline.Amount__c = 0.1;
            payOnline.Mode__c = 'Online';

            payOnline.Customerr__c = eachCust.Id;

            paylist.add(payOnline);

            Paymentts__c payCrypto = new Paymentts__c();
            payCrypto.Amount__c = 1;
            payCrypto.Mode__c = 'Crypto';

            payCrypto.Customerr__c = eachCust.Id;

            paylist.add(payCrypto);    
        }
        if(!paylist.isEmpty()){

        }

        

        }
//         public static void deletePayment(List<Customerr__c> trgOld ){
//             Set<Id> active = new Set<Id>();
//             Set<Id> inactive = new Set<Id>();
//             for(Customerr__c eachCustmr : trgOld){
//                 if(eachCustmr.Amount__c == true){
//                     active.add(eachCustmr.Id);    
//                 }else{
//                     Set<Id> inactive = new Set<Id>();

//                 }
//             }
//             if(!active.isEmpty()){
//                List<Paymentts__c> ListPay = [select id, name FROM Payments__c WHERE Customerr__c in :active];
//                 delete ListPay;
//             }
//             if(!inactive.isEmpty()){
//                 List<Paymentts__c> onlineListPay = [select id, name FROM Payments__c WHERE Customerr__c in :inActive and Mode__c];
//                  delete onlineListPay;


//     }
// }
}