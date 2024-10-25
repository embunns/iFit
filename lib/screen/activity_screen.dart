import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../service/health_service.dart';
import '../widget/activity_card.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final HealthService _healthService = HealthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  void _addActivity() {
    final String name = _nameController.text;
    final int duration = int.tryParse(_durationController.text) ?? 0;

    if (name.isNotEmpty && duration > 0) {
      setState(() {
        _healthService.addActivity(Activity(name: name, duration: duration));
      });
      _nameController.clear();
      _durationController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Aktivitas ditambahkan')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catat Aktivitas Fisik')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple[100]!, Colors.purple[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Aktivitas',
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.directions_run, color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _durationController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Durasi (menit)',
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.timer, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _addActivity,
                icon: Icon(Icons.add),
                label: Text('Tambah Aktivitas'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), backgroundColor: Colors.purple[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ), // Warna tombol
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _healthService.activities.length,
                  itemBuilder: (context, index) {
                    final activity = _healthService.activities[index];
                    return ActivityCard(activity: activity);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
