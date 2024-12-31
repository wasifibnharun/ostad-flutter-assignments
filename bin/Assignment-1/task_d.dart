import 'task_b.dart';

class Teacher extends Person{

  int ? teacherID;
  List<String> coursesTaught = [];

  Teacher(String name, int age, String address, this.coursesTaught): super(name, age, address);

  @override
  void displayRole(){
    print("Role: Teacher");
  }

  void courseTaught(){
    for(String course in coursesTaught){
      print("- $course");
    }
  }

}