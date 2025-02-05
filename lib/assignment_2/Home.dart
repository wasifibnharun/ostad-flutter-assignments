import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<Map<String, String>> _contacts = [];

  _addContact() {
    String name = _nameController.text;
    String phone = _phoneController.text;

    if (name.isNotEmpty && phone.isNotEmpty) {
      setState(() {
        _contacts.add({'name': name, 'phone': phone});
      });

      _nameController.clear();
      _phoneController.clear();
    }
  }

  _deleteContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  deleteContactDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure to delete?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.no_cell_outlined, color: Colors.blue),
            ),
            TextButton(
              onPressed: () {
                _deleteContact(index);
                Navigator.pop(context);
              },
              child: const Icon(Icons.delete, color: Colors.blue),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return "Name cannot be empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter your name',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(height: 10, width: double.infinity,),
                        TextFormField(
                          controller: _phoneController,
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return "Phone number cannot be empty";
                            } else if (value.length < 11) {
                              return "Phone number must be 11 digits";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            hintText: 'Enter your Phone number',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(height: 10, width: double.infinity,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: Size(double.infinity, 40),
                            ),
                            onPressed: (){
                              if (_formKey.currentState!.validate()){
                                _addContact();
                              }
                            },
                            child: Text('Add')
                        ),
                      ],
                    )
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: ListView.builder(
                    itemCount: _contacts.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[50],
                          borderRadius: BorderRadius.circular(8),
                          ),
                        child: ListTile(
                          title: Text(_contacts[index]['name']!, style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.w500),),
                          subtitle: Text(_contacts[index]['phone']!),
                          leading: Icon(Icons.person, color: Colors.brown, size: 40,),
                          trailing: Icon(Icons.phone, color: Colors.blue, size: 30,),
                          onLongPress: (){
                            deleteContactDialog(index);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}