// Store the currency exchange rate values in a Map named ‘currISOCodeAndExchangeRateMap’ for
// any 5 currency ISO codes. Like below:
// a. AUD => 0.73
// b. CAD => 0.78
// c. EUR => 1.13
// d. NZD => 0.68
// e. INR => 0.013
// 2. Fetch the currency conversion rate for any one currency ISO code and print it.
// 3. Check if the above Map has a conversion rate for SAD ISO code.
// 4. Collect all the currency ISO codes from currISOCodeAndExchangeRateMap for which the
// conversion rate is >= 1 in one variable and other iso codes in other variables.



Map<String,Decimal> currISOCodeAndExchangeRateMap = new Map<String,Decimal> ();
currISOCodeAndExchangeRateMap.put('AUD', 0.73);
currISOCodeAndExchangeRateMap.put('CAD', 0.78);
currISOCodeAndExchangeRateMap.put('EUR', 1.13);
currISOCodeAndExchangeRateMap.put('NZD', 0.68);
currISOCodeAndExchangeRateMap.put('INR', 0.013);

decimal eur = currISOCodeAndExchangeRateMap.get('EUR');

System.debug('EUR currency is-->' + eur);
Boolean exist = currISOCodeAndExchangeRateMap.containsKey('SAD');
System.debug('sad var mi yok mu?--->' + exist);

Set<String> lessThan1 = new Set<String>();
Set<String> moreThan1 = new Set<String>();

for(String paraBirimi :currISOCodeAndExchangeRateMap.keySet()){
    if(currISOCodeAndExchangeRateMap.get(paraBirimi)>=1){
        moreThan1.add(paraBirimi);
        }else{
            lessThan1.add(paraBirimi);
        }
}
 System.debug('1 den buyuk ve esitler===>' + moreThan1);

 system.debug('1 den kucukler===>' + lessThan1);