public class DatetimeMethodsDemo {
//     public void calculateAgeInMonths(){
//                                     //YEAR, MONTH, DAY
//         date birthdate = date.newInstance(1990, 10, 9);
//         date todayDate = date.today();

//         integer ageInMonths = birthdate.monthsBetween(todayDate);
//         system.debug('Vitap age is months is ' + ageInMonths);
        
   
    public void calculateAgeInDays(){
        date birthdate = date.newInstance(1979, 3, 30);
        date todayDate = date.today();

        integer ageIndays = birthdate.daysBetween(todayDate);
        system.debug('Sahin age iss days is ' + ageIndays);
    }
//     public void printSubscriptionEndDate(){
//         date subscriptionStartDate = date.today();
        
// //         date subscriptionEndDate = subscriptionStartDate.addDays(1000);
// //         system.debug('subscription end date is .... ' + subscriptionEndDate);

// //         integer endDateMOnth = subscriptionEndDate.month();
// //         system.debug('end date month = ' + endDateMOnth);

// //         integer endDateYear = subscriptionEndDate.year();
// //         system.debug('end date year = ' + endDateYear);
// //     }

// //     public void printOfferEndDateTime(){
// //         datetime offerStartDT = datetime.now();
// //         datetime offerEndDT = offerStartDT.addHours(51);
// //         system.debug('offer end datetime ===> ' + offerEndDT);

// //         date offerEndDate = offerEndDT.date();
// //         system.debug('offer end date => ' + offerEndDate);
// //     }

// public string printAndReturnMsg(string msg){
//     string returnStr = msg + '.....oK COOL';
//     return returnStr;
// }

// public integer add(integer a, integer b){
//     integer sum = a + b;
//     return sum;
// }
// public string  add(string a, string b){
//     string sum = a + ' ' +  b;
//     return sum;
// }
// public integer add(integer a, integer b, integer c){
//     integer sum = a + b +c;
//     return sum;   

}