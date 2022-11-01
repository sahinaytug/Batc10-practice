public class OppSchedulableBatch implements Schedulable {  // iki kez scheduale edemiyoruz. 

    public void execute(SchedulableContext SC) {

        DeleteOppsBatch opps = new DeleteOppsBatch();
        database.executeBatch(opps, 10);
    }
 }
