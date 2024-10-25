import 'package:flutter/material.dart';
import '../models/sleep.dart';
import '../service/health_service.dart';

class SleepScreen extends StatefulWidget {
  @override
  _SleepScreenState createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  final HealthService _healthService = HealthService();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  void _addSleep() {
    final DateTime startTime = DateTime.tryParse(_startTimeController.text) ?? DateTime.now();
    final DateTime endTime = DateTime.tryParse(_endTimeController.text) ?? DateTime.now();

    if (endTime.isAfter(startTime)) {
      _healthService.addSleep(Sleep(startTime: startTime, endTime: endTime));
      _startTimeController.clear();
      _endTimeController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tidur ditambahkan')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catat Jadwal Tidur')),
      body: Column(
        children: [
          TextField(controller: _startTimeController, decoration: InputDecoration(labelText: 'Waktu Mulai')),
          TextField(controller: _endTimeController, decoration: InputDecoration(labelText: 'Waktu Selesai')),
          ElevatedButton(onPressed: _addSleep, child: Text('Tambah Tidur')),
        ],
      ),
    );
  }
}
