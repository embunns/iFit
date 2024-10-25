import '../models/activity.dart';
import '../models/food.dart';
import '../models/sleep.dart';

class HealthService {
  List<Activity> activities = [];
  List<Food> foods = [];
  List<Sleep> sleeps = [];

  void addActivity(Activity activity) {
    activities.add(activity);
  }

  void addFood(Food food) {
    foods.add(food);
  }

  void addSleep(Sleep sleep) {
    sleeps.add(sleep);
  }

  String analyzeHealth() {
    int totalCalories = foods.fold(0, (sum, food) => sum + food.calories);
    int totalActivity = activities.fold(0, (sum, activity) => sum + activity.duration);

    if (totalCalories < 2000 && totalActivity > 30) {
      return "Kesehatan Anda baik! Teruskan gaya hidup sehat!";
    } else {
      return "Perhatikan asupan kalori dan tingkat aktivitas Anda.";
    }
  }
}
