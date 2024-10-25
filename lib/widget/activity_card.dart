import 'package:flutter/material.dart';
import '../../models/activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 5,
      child: ListTile(
        leading: Icon(Icons.directions_run, color: Colors.blue),
        title: Text(activity.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${activity.duration} menit'),
        trailing: Icon(Icons.check_circle, color: Colors.green),
      ),
    );
  }
}
