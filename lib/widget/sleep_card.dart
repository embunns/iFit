import 'package:flutter/material.dart';
import '../../models/sleep.dart';

class SleepCard extends StatelessWidget {
  final Sleep sleep;

  SleepCard({required this.sleep});

  @override
  Widget build(BuildContext context) {
    final duration = sleep.endTime.difference(sleep.startTime);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 5,
      child: ListTile(
        leading: Icon(Icons.bedtime, color: Colors.purple),
        title: Text(
          'Tidur: ${sleep.startTime.hour}:${sleep.startTime.minute} - ${sleep.endTime.hour}:${sleep.endTime.minute}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Durasi: ${duration.inHours} jam ${duration.inMinutes % 60} menit'),
        trailing: Icon(Icons.check_circle, color: Colors.green),
      ),
    );
  }
}
