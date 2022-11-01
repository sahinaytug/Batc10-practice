trigger OpportunityTrigger on Opportunity (after insert,after update, after delete,after undelete) {
        /*  Create future methods which takes the set of Account Ids and do the following tasks:
          A. Update the "Highest Amount Opportunity Name" field at Account level with the
          opportunity Name which has the Highest amount among the opportunities related to
          the account.
          B. Update the 'Target Amount Achieved Opportunity Name' at Account level with the
          Closed Won Opportunity Name. Populate the opportunity name which has the highest
          value in the Amount field, and it should be more than 'Target Amount' field value at
          account.
          C. Update the 'Total Amount Generated' at Account with the total of Amount for all the
          closed Won Opportunities related to an Account.
          
              Please Note: Above updates should happen whenever any of the following event occurs:
          i. Amount field is Updated at Opportunity level.
          ii. Opportunity stageName is changed.
          iii. Opportunity is reparented i.e AccountId field value is changed.
          iv. A new Opportunity is created and tagged to an account.
          v. An Opportunity is deleted or undeleted
              */    
          Set<Id> AccSetId =new Set<Id>();
          if(trigger.isAfter){
              if(Trigger.isInsert || Trigger.isUndelete){
                  for (opportunity eachOpp : trigger.New) {
                      if(eachOpp.AccountId !=null ){
                          AccSetId.add(eachOpp.AccountId);
                      }
                  }
              }
              if(Trigger.isUpdate){
                  for (opportunity eachOpp : trigger.New) {
                      if(eachOpp.AccountId !=Trigger.oldMap.get(eachOpp.Id).AccountId ||eachOpp.StageName !=Trigger.oldMap.get(eachOpp.Id).StageName || eachOpp.Amount !=Trigger.oldMap.get(eachOpp.Id).Amount){
                          AccSetId.add(eachOpp.AccountId);
                          AccSetId.add(Trigger.oldMap.get(eachOpp.Id).AccountId);
                         }
                      }
              }
              if(trigger.isDelete){
                  for (opportunity eachOppOld : Trigger.old) {
                      if(eachOppOld.AccountId != null){
                          AccSetId.add(eachOppOld.AccountId);
                      }
                  }
              }
             /* if(Trigger.isUndelete){
                  for (Oppottunity eachOppUnde : trigger.new) {
                      if(eachOppUnde.AccountId != null){
                          AccSetId.add(eachOppUnde.AccountId);
                      }
                  }
            }*/
            if(!AccSetId.isEmpty()){
              OpportunityTriggerHandler.updateHighestAmountOppName(AccSetId);
              OpportunityTriggerHandler.updateTargetAmountAchievedOppName(AccSetId);
              OpportunityTriggerHandler.updateTotalAmountGenerated(AccSetId);
            }    
      }
      }

