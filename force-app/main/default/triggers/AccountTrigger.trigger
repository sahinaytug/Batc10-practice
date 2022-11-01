trigger AccountTrigger on Account (before update, before insert, 
after insert, after update) {
//     if(Trigger.isInsert){
//     AccountTriggerHandler.AccountInsert(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
// }
// if(Trigger.isUpdate){ 
//     AccountTriggerHandler.oppUpdate (Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);

// }

// if(Trigger.isAfter && Trigger.isUpdate){
//     AccountTriggerHandler.updateAccRelatedContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);

// }


if(Trigger.isAfter && Trigger.isUpdate){
    AccountTriggerHandler.descUpdate(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);

}


}
