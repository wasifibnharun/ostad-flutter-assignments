import 'task_c.dart';
import 'task_d.dart';

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