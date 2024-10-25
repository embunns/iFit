import 'package:flutter/material.dart';
import '../../models/food.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  FoodCard({required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 5,
      child: ListTile(
        leading: Icon(Icons.fastfood, color: Colors.orange),
        title: Text(food.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${food.calories} kalori'),
        trailing: Icon(Icons.check_circle, color: Colors.green),
      ),
    );
  }
}
