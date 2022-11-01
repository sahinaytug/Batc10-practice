public  class OpportunityTriggerHandler {
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
        @future
        public static void updateHighestAmountOppName(Set<Id> AccSetId){
            List <Account> listAcc = [select id,Highest_Amount_Opportunity_Name__c, (Select id, Name,Amount from Opportunities where amount != null ORDER BY Amount DESC) From  Account WHERE Id in: AccSetId ];
            for (account  eachAccUp : listAcc) {
                eachAccUp.Highest_Amount_Opportunity_Name__c = eachAccUp.Opportunities[0].Name;    
            }
            update listAcc;
        }
        @future
        public static void updateTargetAmountAchievedOppName(Set<Id> AccSetId){
            List <Account> listAcc = [select id,Target_Amount_Achieved_Opportunity_Name__c,Target_Amount__c, (Select id,Name, Amount from Opportunities where amount != null and StageName = 'Closed Won' ORDER BY Amount DESC) From  Account WHERE Id in: AccSetId ];
            for (account  eachAccUp : listAcc) {
               if(eachAccUp.Opportunities[0].Amount > eachAccUp.Target_Amount__c){
                    eachAccUp.Target_Amount_Achieved_Opportunity_Name__c = eachAccUp.Opportunities[0].Name;
                }else{
                    eachAccUp.Target_Amount_Achieved_Opportunity_Name__c = null;
                }   
            }
            update listAcc;    
        } 
        @future
        public static void updateTotalAmountGenerated(Set<Id> AccSetId){
    
            List <Account> listAcc = [select id,Total_Amount_Generated__c, (Select id,Name, Amount from Opportunities where amount != null and StageName = 'Closed Won' ) From  Account WHERE Id in: AccSetId ];
            for (account  eachAccUp : listAcc) {
                decimal totalAmount = 0;
               for(Opportunity eachOpp :eachAccUp.Opportunities){
                totalAmount += eachOpp.Amount;
            }
            eachAccUp.Total_Amount_Generated__c = totalAmount;    
            }
            update listAcc;    
        }    
    }