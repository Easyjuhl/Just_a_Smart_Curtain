import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'slide.dart';
import 'handler.dart';

void main() {
  runApp(
    const CurtainApp()
  );
}

class CurtainApp extends StatelessWidget {
  const CurtainApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Curtain',
      home: DevicePage()
    
    );
  }
}

class DevicePage extends StatefulWidget {
  const DevicePage
({ Key? key }) : super(key: key);

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  
  late Command _command;

  @override
  void initState() {
    super.initState();
    _command = Command(50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Device 1'),
            ControlSlider(command: _command),
            TextButton(
              onPressed: () {
                print('Button works');
                var req = BobWithData(_command);
                String json = jsonEncode(req);
                http.post(
                  Uri.parse('http://10.0.2.2:5000'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: json,
                );
              }, 
              child: const Text('Send')
            )
          ]
        )
      )
      
    );
  }
}
