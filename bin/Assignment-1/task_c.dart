import 'package:collection/collection.dart';
import 'task_b.dart';

class Student extends Person{
  int ? studentID;
  String ? grade;
  List<int> courseScores = [];

  Student(String name, int age, String address, this.courseScores): super(name, age, address);

  @override
  void displayRole(){
    print("Role: Student");
  }

  double calculateAvgScore(){
    double avg = courseScores.sum / courseScores.length;
    return avg;
  }

}