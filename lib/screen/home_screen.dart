import 'package:flutter/material.dart';
import 'activity_screen.dart';
import 'food_screen.dart';
import 'sleep_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Manajemen Kesehatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Aktivitas Fisik
              _buildClickableCard(
                context,
                'assets/images/activity.jpg',
                'Catat Aktivitas Fisik',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActivityScreen()),
                  );
                },
              ),
              SizedBox(height: 30),

              // Asupan Makanan
              _buildClickableCard(
                context,
                'assets/images/food.jpg',
                'Catat Asupan Makanan',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodScreen()),
                  );
                },
              ),
              SizedBox(height: 30),

              // Jadwal Tidur
              _buildClickableCard(
                context,
                'assets/images/sleep.jpg',
                'Catat Jadwal Tidur',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SleepScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClickableCard(
      BuildContext context,
      String imagePath,
      String buttonText,
      VoidCallback onTap,
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
