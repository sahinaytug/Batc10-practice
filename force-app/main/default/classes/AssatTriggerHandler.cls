public  class AssatTriggerHandler {
    public TriggerHandlerUpdate(List<Asset> AssTriggerNew,
                                List<Asset> AssTriggerOld, 
                                 Map<id, asset> AssTriggerNewMap,
                                 Map<Id,Asset> AssTriggerOldMap ) {
    for(Asset eachAsset : AssTriggerNew){
        if(Trigger.isBefore && eachAsset.status != 'Shipped'){
            eachAsset.status.addError('System will only accept Shipped');
        }
    }                                

    }
}
