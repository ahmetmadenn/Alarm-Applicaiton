import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class AlarmApp extends StatefulWidget {
  @override
  State<AlarmApp> createState() => _AlarmAppState();
}

class _AlarmAppState extends State<AlarmApp> {
// Saatlerce sürecek metin düzenleme denetleyicisi oluşturma
// ve girdi olarak dakika
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm Uygulaması '),
        centerTitle: true,
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(11)),
                child: Center(
                  child: TextField(
                    controller: hourController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(11)),
                child: Center(
                  child: TextField(
                    controller: minuteController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'Alarm Oluştur ',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                int hour;
                int minutes;
                hour = int.parse(hourController.text);
                minutes = int.parse(minuteController.text);

                // saati dönüştürdükten sonra alarm oluşturma
                // ve dakika tamsayıya
                FlutterAlarmClock.createAlarm(hour, minutes);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // show alarm
              FlutterAlarmClock.showAlarms();
            },
            child: const Text(
              'Alarmları Göster',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ]),
      )),
    );
  }
}
