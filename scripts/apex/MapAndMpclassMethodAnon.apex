Map<String,String> studentRank = new Map<String,String>();
studentRank.put('Jeff', '45');
studentRank.put('Buffet', '35');
studentRank.put('Elan', '99');
studentRank.put('Biden', '21');
System.debug('Names and ranks==>' + studentRank);

Set<String> allStudents = studentRank.keySet();
System.debug('all names are ==> ' + allStudents);

list<String> allRanks = studentRank.values();
System.debug('all ranks are: ==> ' + allRanks);

Set<String> names = studentRank.keySet();
System.debug('Name: ==>' + names);
    for(String eachName : names){
        System.debug('name: ' + eachName);
        String eachRank = studentRank.get(eachName);
        System.debug('rank: ' + eachRank);
        System.debug('****************');
}

// Decide the data type for key and value.
// 2. Store 4 students' names and their ranks.
// 3. Print all the students' names one by one.
// 4. Print all the student names and rank one by one in the below format.
// Student Name : ??????? and Rank : ????