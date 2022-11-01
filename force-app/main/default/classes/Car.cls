public class Car {
    public string carColor = '';
    public string carName = '';

    integer maxSpeedKmPerHr = 150;

    public void switchOn(){
        system.debug('Starting the car NOWWWW1');
    }

        public void drive(){
            switchOn();
            system.debug('Driving ' + carName);   
    }
    public void drivingAtMaxSpeed(){
        drive();
        string drivingDescription = 'drivin' + carName + 'at' + maxSpeedKmPerHr + 'km/ph';
        system.debug(drivingDescription);
    }


 
}
