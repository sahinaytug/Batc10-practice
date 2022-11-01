public  class AccConAndOppOperations {
  //     Question 4: SOQL In Apex and DML
    //     Create a class named as AccConAndOppOperations and Write methods for each of the following requirements:
    //     1. Write the logic to fetch and return all the accounts. Include account name, annual revenue, type, and source of account.
    public static List<account> method1(){
        List<account> listacc = [SELECT Id, Name, AnnualRevenue, AccountSource, type from account];
        return listacc;
    }
    //     2. Find all the opportunities which have Lead Source as ‘Web’ and Stage as ‘Closed Lost’. Make it dynamic so that it works for other stages and Lead sources as well.
    public static void method2(string stageName, string source){
        List<Opportunity> listOpp = [SELECT Id, Name, LeadSource, StageName from Opportunity WHERE LeadSource =: source  And StageName =: stageName];
        system.debug('Method 1' + listOpp);
   
   
// }
// public static void method3(string accType, string stageName){
//   List<Account> listAcc = [SELECT Id, Name, AnnualRevenue, Type,(SELECT Name, Amount, stageName from Opportunities where stageName =: stageName) from Account where Type =: accType];
//   for(Account eachAccount : listAcc){
//       system.debug('-------------------------------------------------------------------');
//       system.debug('Account Name = ' + eachAccount.Name + ' Annual Revenue = ' + eachAccount.AnnualRevenue);
//       for(Opportunity eachOpp : eachAccount.Opportunities){
//           system.debug('***************************************');
//           system.debug('opportunityName =' + eachOpp.Name + ' OpportuniyAmount =' + eachOpp.Amount);
//       }
//   }
// }

//     // Prepare a method that returns the sum of all the closed won opportunities Amount present in the org.
//     public static decimal sumAmount(){
//       List<Opportunity> lstOpp = [SELECT id, name, amount FROM Opportunity WHERE StageName ='Closed Won' and Amount !=Null];
//       decimal sum = 0;
//       if(!lstOpp.isEmpty()){
//           for(Opportunity eachOpp : lstOpp){
//               sum = sum + eachOpp.Amount;
//           }
//       }
//       return sum;
//   }

//   public static List<Account> AccWithOpp (String OppStageName){

//     List<Account> AccList = [ Select Id,Name from Account where Id in (Select AccountId from Opportunity where AccountId != Null and StageName =: OppStageName) ];

//     return AccList;
//   }

//   public static List<Account> ContAcc (){
//     List<Contact> conList = [select AccountId from contact  where AccountId != Null];
//     Set<Id> AccIds = new Set<Id>();
//     for ( Contact eachCon : conList) {
//      AccIds.add (eachCon.AccountId);
//     }
//     List<Account> AccList =[ select id , Name from Account where Id in : AccIds];
//     return AccList;
// }

// Write a logic to create and return n number of opportunities for a particular AccountId.
// AccountId and n will be passed as parameters in the method.
// Populate opportunity fields as follows:
// Close date as 3 years from today
// Stage name as Prospecting
// Opportunity amount as Account’s annual revenue divided by n
// and Opportunity name same as Account name
// For Ex: if n=2, Then two new opportunities If n=0, Print the message as “Please tell us how many
// opportunities needs to be created”

// public static List<Opportunity> nOpp(integer n, Id AccId){
//   List<Opportunity> listOfOpp = new List<Opportunity>();
//   if( n > 0 ){
//       Account Acc = [select id, name, Annualrevenue FROM Account where id = :AccId];
     
//       for(integer i = 1; i <= n; i++){
//           Opportunity opt1 = new Opportunity();
//           opt1.CloseDate = Date.today().addYears(3);
//           opt1.StageName = 'Prospecting';
//       if( Acc.AnnualRevenue != null){
//               opt1.Amount = Acc.AnnualRevenue/n;
//           }
//           opt1.name = Acc.name + i;
//           listOfOpp.add(opt1);
//       }
//        }else{
//           System.debug('Please tell us how many opportunities needs to be created');
// }
//       return listOfOpp;
// }
//WEEK 4 Q 4-5
// Find out all the Account which have no contacts attached to them. Add a contact for each one of
// them and update the last Name of contact with the Name field of account.
// 5. Delete all the opportunities with amount less than 20000 and status as closed lost.

List<Account> results = [SELECT Id, Name, (Select Name from Contacts) FROM Account];
List<Account> accList = new List<Account>();
for(Account result : results){
    if(result.Contacts.size() == 0){
        accList.add(result);
    }
}

System.debug('Acc List'+accList);
// Opportunity[] doomedOpp = [SELECT Id, Name FROM Opportunity 
//                          WHERE Amount > 20000 ]; 
// try {
//     delete doomedOpp;
// } catch (DmlException e) {
//     // Process exception here
// }


}

 
}