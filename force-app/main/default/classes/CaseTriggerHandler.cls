public class CaseTriggerHandler {
    public static void CreateChildCase(List<Case> CsaeTriggerNew) {
        Set<Id> CsaeSetId = new Set<Id>();
        for (Case eachCs : CsaeTriggerNew) {
           if(eachCs.Description.contains('password')) {

           }
            
        }
        if(!CsaeSetId.isEmpty()){
            List<Case> ChildCaseList = new List<Case>();
            for(Id ParentId : CsaeSetId){
                Case c = new Case();
                c.Subject = 'Parent Case may contain secret info, do something NOW';
                c.ParentId = ParentId;
                c.Priority = 'High';
                c.Description = 'Secret info not allowed in case';
                ChildCaseList.add(c);
            } 
         insert ChildCaseList;
        
        }
        

    }
}
