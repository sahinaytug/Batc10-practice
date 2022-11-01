// List<account> listacc = AccConAndOppOperations.method1();
// system.debug('Method1--> '+ listacc);
// AccConAndOppOperations.method2('Closed Won', 'Web');
// AccConAndOppOperations.method3('Customer - Direct', 'Closed Won');

List<Account> results = [SELECT Id, Name, (Select Name from Contacts) FROM Account];
List<Account> accList = new List<Account>();
for(Account result : results){
    if(result.Contacts.size() == 0){
        accList.add(result);
    }
}

System.debug('Acc List'+accList);