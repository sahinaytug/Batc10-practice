DmlDemo2.dmlInsertDemo();
Decimal sumAmount = AccConAndOppOperations.sumAmount();
System.debug(sumAmount);

List<account> listacc1 = AccConAndOppOperations.AccWithOpp('Closed Won');
System.debug(listacc1);

List<Account> AccList = AccConAndOppOperations.ContAcc();
system.debug(AccList);

