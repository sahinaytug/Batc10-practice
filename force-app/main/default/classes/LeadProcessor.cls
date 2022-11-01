global  class LeadProcessor implements Database.Batchable<SObject>{
    global Integer count = 0;

    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT ID, LeadSource FROM Lead');
    }
    global void execute (Database.BatchableContext bc, List<Lead> L_list){
        List<Lead> L_list_new = new List<Lead>();

        for(lead L:L_list);{
            L.LeadSource = 'Dreamforce';
            L_list_new.add(L);
            count += 1;
        }
        update L_list_new;
    }
    global void finsih(Database.BatchableContext bc){
        System.debug('count = ' +count);
    }
}
public class LeadProcessor implements Database.Batchable<sObject>,Database.stateful{
    integer count = 0;
    public database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator ql = Database.getQueryLocator([select  LeadSource from Lead]);
        return ql;
    }
    public void execute(Database.BatchableContext bc, list<Lead> scope){
        for (Lead L : scope){
            L.LeadSource += 'Dreamforce';
        }
        count++;
        system.debug('Count is' + count);
        update scope;
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Total number of count'+ count);
    }
}