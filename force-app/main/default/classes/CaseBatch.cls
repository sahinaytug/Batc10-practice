public with sharing class CaseBatch implements Database.Batchable<sObject>, Database.stateful,Schedulable {
    public void execute(SchedulableContext SC) {

        CaseBatch task1 = new CaseBatch();
        database.executeBatch(task1, 10);
    }
    Integer count = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator ql = Database.getQueryLocator([select id,OwnerId  from Case WHERE Status != 'Closed'  and LastModifiedDate < LAST_N_DAYS :5]);
        return ql;
    }
    public void execute(Database.BatchableContext bc, List<Case> scope){
        List<Task> newTask = new List<Task>();
        for( Case c : scope){
           Task t = new Task();
           t.Subject = 'Critical action needed' ;
           t.ActivityDate = Date.today().addDays(2);
           t.Description = 'Complete fast' ;
           t.WhatId = c.Id;
           t.OwnerId = c.OwnerId;
           t.Status = 'In Progress';
         newTask.add(t);
        }
        if (!newTask.isEmpty()) {
            insert newTask;
            count += newTask.size();   
        }
        }public void finish(Database.BatchableContext bc){
        system.debug('# of Task ' + count);
        }
    }

// Write a logic in Batch  to Create tasks for all the cases other than the closed nd on which there
// was no activity since last 5 days.
// a. Implement the above logic in such a way that whenever required subject and Comments
// field value can be changed without the code change.
// Populate the task field values as follows:
// Field Value
// Subject Critical action needed
// Due Date Today + 2 days.
// Comments Complete fast.
// Related To Case Id
// Assigned To Case Owner Id
// Status In Progress
// 4. Write a schedulable class to schedule the batch class written in question 3 and schedule the
// class to run at 1am every Monday.
// Write a Test class for all the above classes if possible