DeleteOppsBatch opps = new DeleteOppsBatch();
id batchId = database.executeBatch(opps, 10);
system.debug(batchId); 