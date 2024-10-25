import 'package:flutter/material.dart';
import '../models/food.dart';
import '../service/health_service.dart';

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final HealthService _healthService = HealthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();

  void _addFood() {
    final String name = _nameController.text;
    final int calories = int.tryParse(_caloriesController.text) ?? 0;

    if (name.isNotEmpty && calories > 0) {
      _healthService.addFood(Food(name: name, calories: calories));
      _nameController.clear();
      _caloriesController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Makanan ditambahkan')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catat Asupan Makanan')),
      body: Column(
        children: [
          TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Nama Makanan')),
          TextField(controller: _caloriesController, decoration: InputDecoration(labelText: 'Kalori')),
          ElevatedButton(onPressed: _addFood, child: Text('Tambah Makanan')),
        ],
      ),
    );
  }
}
