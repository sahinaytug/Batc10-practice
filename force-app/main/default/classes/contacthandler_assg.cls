public  class contacthandler_assg {
    public static void creatContacts(List<account> accTriggerNew,
    List<account> accTriggerOld, 
    Map<id, account> accTriggerNewMap,
    Map<id, account> accTriggerOldMap) {
List<Contact> ConList = new list<Contact>();

if(Trigger.isInsert){
for(Account eachAcc : accTriggerNew){
Contact Cont = new Contact();
Cont.AccountId = eachAcc.Id;
Cont.LastName = 'Aytug';
ConList.add(Cont);
}
insert ConList;
}

}

public static void updateContactPhone(List<Contact> conNewList){
    Set<Id> accSetIds = new set<id>();

    for(Contact eachCont : conNewList){  
        accSetIds.add(eachCont.AccountId);

    }
    List<Account> AccList = [select id, phone FROM Account WHERE Id in:accSetIds];
    if(!AccList.isEmpty()){
        Map<Id,Account> accRecMap = new Map<Id,Account>();
        for(Account Acc : AccList){
            accRecMap.put(acc.Id, acc);
        }
        for (contact con : conNewList) {
            if (accRecMap.containsKey(con.AccountId)) {
                con.OtherPhone = accRecMap.get(con.AccountId).Phone;
                
            }
            
        }
    }
}
}
