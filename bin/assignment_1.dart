import 'package:collection/collection.dart';

abstract class Role{
  void displayRole();
}

class Person implements Role {
  String _name;
  int _age;
  String _address;

  Person(this._name, this._age, this._address);

  String get getName => _name;
  int get getAge => _age;
  String get getAddress => _address;

  @override
  void displayRole() {
    //print("Role: ");
  }

}

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

main() {

  Student john = Student("John Doe", 20, "123 Main St", [90, 85, 82]);
  void displayStudentInfo(){
    print("Student Information: \n");
    john.displayRole();
    print("Name: ${john.getName}");
    print("Age: ${john.getAge}");
    print("Address: ${john.getAddress}");
    print("Average Score: ${john.calculateAvgScore().toStringAsFixed(1)}\n\n");
  }
  displayStudentInfo();


  Teacher smith = Teacher("Mrs. Smith", 35, "456 Oak St", ["Math", "English", "Bangla"]);
  void displayTeacherInfo(){
    print("Teacher Information: \n");
    smith.displayRole();
    print("Name: ${smith.getName}");
    print("Age: ${smith.getAge}");
    print("Address: ${smith.getAddress}");
    print("Courses taught: ");
    smith.courseTaught();
  }
  displayTeacherInfo();

}