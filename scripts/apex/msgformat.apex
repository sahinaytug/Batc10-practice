//JASON//
// 1.What is JSON format?
Account => {Name = 'Test Account', Type = 'Prospect', 
Industry = 'IT', AnnualRevenue = 1,000,000}
{
    'Name' : 'Test Account',
    'Type' : 'Prospect',
    'Industry' : 'IT',
    'AnnualRevenue' = 10000000
}

// 2.How to convert our sObject record(s) into JSON format?
// Class - JSON
// Method - serialize => helps us to convert every sObject record(s) into JSON format

Account acc = [SELECT id, Name, Type, Industry, AnnualRevenue
             FROM Account
             where  AnnualRevenue != Null
             LIMIT 1];
String jasonString = JSON.serialize(acc);
System.debug(jasonString);