Set<String> uniqueNameSet = new Set<String> {'Tom', 'Jerry'};
System.debug(uniqueNameSet);

for(String addName : uniqueNameSet){
}
Integer listNmame = uniqueNameSet.size();
System.debug('List of names: ' + listNmame);

uniqueNameSet.add('Kity');
System.debug(uniqueNameSet);
System.debug('Is contain Kity' + uniqueNameSet.contains(' Kity'));
System.debug(uniqueNameSet.isEmpty());



// In an anonymous apex file, Create a set of strings named as uniqueNameSet with “Tom” and
// “Jerry” as the default values in it.
// 2. Print the size of the above created Set.
// 3. Add new elements in the uniqueNameSet.
// 4. Check if uniqueNameSet contains your name?
// 5. Check if the uniqueNameSet is Empty.
// 6. Clear the set and print it.
// 7. Now check if the set is empty or not. 
// 8. Is it possible to get an element from a set with the help of an index? If Yes, then please write the
// code for the same and If No, then why is it not possible
// 9. List down at the differences between set and list.I