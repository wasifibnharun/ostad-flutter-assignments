import 'task_a.dart';

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