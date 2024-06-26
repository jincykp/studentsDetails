import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student2/MODEL/user.dart';
import 'package:student2/SCREENS/firstScreen.dart';
import 'package:student2/SCREENS/userservice.dart';

class Adduser extends StatefulWidget {
  const Adduser({super.key});

  @override
  State<Adduser> createState() => _AdduserState();
}

class _AdduserState extends State<Adduser> {
  final _usernamecontroller = TextEditingController();
  final _useragecontroller = TextEditingController();
  final _usercontactcontroller = TextEditingController();
  final _userregcontroller = TextEditingController();
  String? image;

  final _formkey = GlobalKey<FormState>();

  final _Userservice = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'REGISTER',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 32, 129, 185),
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Center(
                    child: Card(
                      elevation: 30,
                      color: Color.fromARGB(255, 133, 195, 231),
                      child: Container(
                        width: 350,
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              image == null
                                  ? CircleAvatar(
                                      radius: 50,
                                      child: IconButton(
                                        onPressed: () {
                                          // Add your logic here
                                          getimage();
                                        },
                                        icon: const Icon(Icons.photo),
                                        iconSize: 53,
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 50,
                                      backgroundImage: FileImage(File(image!)),
                                    ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _usernamecontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  hintText: 'Enter the Name ',

                                  //labelText: 'NAME',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your Name !';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _useragecontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  hintText: 'Enter the age',
                                  labelText: 'AGE',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your Age !';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _userregcontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  hintText: 'Reg NO',
                                  labelText: "Reg NO",
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Reg number !';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.phone,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _usercontactcontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  hintText: 'Enter the contact',
                                  labelText: 'PHONE NO.',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter the contact !';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton.icon(
                                      style: TextButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                      onPressed: () async {
                                        if (_formkey.currentState!.validate()) {
                                          var user = USer();

                                          user.name = _usernamecontroller.text;
                                          user.age = _useragecontroller.text;
                                          user.contact =
                                              _usercontactcontroller.text;
                                          user.Reg = _userregcontroller.text;
                                          user.photo = image;
                                          await _Userservice.saveUser(user);
                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      const HomeScreen()));
                                          // ignore: use_build_context_synchronously
                                          snack(context);
                                        } else {}

                                        //print(result);
                                      },
                                      icon: const Icon(Icons.save),
                                      label: const Text('SAVE')),
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  TextButton.icon(
                                      style: TextButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              221, 255, 255, 255)),
                                      onPressed: () {
                                        _useragecontroller.text = '';
                                        _usernamecontroller.text = '';
                                        _usercontactcontroller.text = '';
                                        _userregcontroller.text = "";
                                      },
                                      icon: const Icon(Icons.delete),
                                      label: const Text('clear')),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getimage() async {
    final imagePicker = ImagePicker();

    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        image = pickedImage.path;
      });
    }
  }

  Future<void> snack(BuildContext ctx) async {
    final _errormessege = 'Student details added successfully ';
    // snackbar
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color.fromARGB(255, 32, 145, 21),
      margin: const EdgeInsets.all(20),
      content: Text(_errormessege),
      duration: const Duration(seconds: 3),
    ));
  }
}
