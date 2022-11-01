//1. Write a Batch class to delete all the opportunities with a stage name as Closed Lost. Print the total number of records deleted by batch apex.

public class DeleteOppsBatch implements Database.Batchable<sObject>, Database.stateful{
 
    Integer count = 0;
    
        public Database.QueryLocator start(Database.BatchableContext BC){
            database.QueryLocator ql = database.getQueryLocator([Select id, name From Opportunity WHERE stageName = 'Closed Lost']);
            return ql;
        }
        public void execute(Database.BatchableContext BC, List<Opportunity> scope){ //bos gelir closed lost yoktur.
    
    
            if(!scope.isEmpty()){ 
                delete scope;
                //count = count + scope.size();    // donusu integer , her batch de scope size i count uzerine 
                
                count += scope.size();
            }
    
            }
     
        public void finish(Database.BatchableContext BC){
            system.debug('total deleted number of Closed Lost' + count);
    
        }
     }