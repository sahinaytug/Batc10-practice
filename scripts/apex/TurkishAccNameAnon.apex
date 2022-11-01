Account SummerFestLLC =  [Select  Name from Account 
where Name =:'Summer Fest LLC'];

List<Contact> newAcc = new List<Contact>();

for(Integer i = 0; i < 3; i++){
    Contact newCnt = new Contact();

    newCnt.LastName = 'Event Planer 1' +i;
    newCnt.Phone = '+1 365426548';
    newCnt.LeadSource = 'Web';
    newCnt.AccountId = SummerFestLLC.Id;

    newAcc.add(newCnt);
}
    Insert newAcc;

// Account Acc = [Select Id, Name from Account 
//where Name =:'University of Arizona'];
// Account newAcc = new Account();

// newAcc.Name = 'Summer Fest LLC';
// newAcc.Type = 'Technology Parter';
// newAcc.Rating = 'Hot';
// newAcc.AnnualRevenue = 200000000;
// newAcc.ParentId = Acc.Id;

// insert newAcc;
