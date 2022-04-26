class Command {
  Command(this.sliderVal); //Constructing...
  
  int sliderVal;
  var alm = false;

  Map<String, dynamic> toJson() => {
    'alm': alm,
    'sliderValue': sliderVal
  };
}

class BobWithData {
  BobWithData(this.command);
  var user = 'UserOne';
  var deviceName = 'Device 1';
  var command;

  Map<String, dynamic> toJson() => {
    'user': user,
    'deviceName': deviceName,
    'INTENT': command
  };
}