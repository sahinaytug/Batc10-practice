public  class AccountTriggerHandler {
    public static void descUpdate (List<Account> TriggeNnew, List<Account> triggerOld, Map<Id,Account> TriggerNewMap, Map<Id,Account> TriggerOldMap){
        Set<Id> IdsForUpdate = new set<Id>();
        for(Account eachAcc : TriggeNnew){
            if(eachAcc.Description != TriggerOldMap.get(eachAcc.Id).Description){
                IdsForUpdate.add(eachAcc.Id);
            }
        }
        oppAndContactUpdate(IdsForUpdate);
    }

    @future
    public static void oppAndContactUpdate(Set<Id> setIds){
        System.debug('future method called');
        System.debug('inerted priject ids' + setIds);

        List<Opportunity> listOpp = [select id, AccountId, Description, Account.Description FROM Opportunity WHERE AccountId in :setIds];
        for (Opportunity eachOpp : listOpp) {
            eachOpp.Description = eachOpp.Account.Description;
            
        }

        update listOpp;

        List<Contact> conList = [select id, AccountId, Description, Account.Description FROM Contact WHERE AccountId in :setIds ];
        for (Contact eachCon : conList) {
            eachCon.Description = eachCon.Account.Description;
            
        }
        update conList;
    }

//     public static void AccountInsert(List<Account> accTriggerNew, List<Account> accTriggerOld, Map<Id, Account> accTriggerNewMap, Map<Id,Account> accTriggerOldMap) {
//         List<Contact> contList = new  List<Contact>();
//          for (account eachAccount : accTriggerNew) {
//             Contact cnt = new Contact();
//             cnt.LastName = eachAccount.Name;
//             cnt.Phone = eachAccount.Phone;
//             cnt.AccountId = eachAccount.Id;
//             contList.add(cnt);
            
//          }
//          if (!contList.isEmpty()) {
//             insert contList;
            
//          }  

//     }

//   //2. Write a trigger on the Account when the Account is updated, check all opportunities related to
// //the account. Update all Opportunity Stage to close lost if stage name not already set to closed won.

// public static void oppUpdate(List<Account> accTriggerNew, List<Account> accTriggerOld, Map<Id, Account> accTriggerNewMap, Map<Id, Account> accTriggerOldMap){

//     List<Opportunity> oppList = [SELECT id, name, stageName from Opportunity WHERE accountId IN :accTriggerNew AND StageName != 'Closed Won'];
    
//     if(!oppList.isEmpty()){
//         for (opportunity eachOpp : oppList) {
//             eachOpp.StageName = 'Closed Lost';
//         }
//         update oppList;
    
//     }
    
//     }

//     public Static void updateAccRelatedContacts(List<Account> accTriggerNew, List<Account> accTriggerOld,
//     Map<Id, Account> accTriggerNewMap, Map<Id, Account> accTriggerOldMap) {

//        Set<Id> AccIds = new Set<Id>();

//        For(Id key: accTriggerOldMap.keySet()){
//            Account oldAcc = accTriggerOldMap.get(key);
//            Account newAcc = accTriggerNewMap.get(key);

//            If(oldAcc.Phone != newAcc.Phone){
//                AccIds.add(key);  
//            }
 
//        }
//        List<Contact> ContList = [SELECT AccountId, otherPhone, MobilePhone FROM Contact Where AccountId in :AccIds];
//        For( Contact eachCont : ContList){
//            eachCont.MobilePhone = accTriggerNewMap.get(eachCont.AccountId).Phone;
//            eachCont.OtherPhone = accTriggerOldMap.get(eachCont.AccountId).Phone;
//        }
//        update ContList;
//    }

   
}


    