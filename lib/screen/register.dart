import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:utcapp/localStorage/database.dart';
import 'package:utcapp/screen/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String? name, email, password;
  var local;

  Future<void> registerFirebase(email, password) async {
    MaterialPageRoute materialPageRoute;
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              materialPageRoute = MaterialPageRoute(
                  builder: (BuildContext context) => const Login()),
              Navigator.of(context)
                  .pushAndRemoveUntil(materialPageRoute, (route) => false),
            })
        .catchError((onError) {
      print(onError);
      var msg = '$onError';
      showAlert(msg);
    });
  }

  void showAlert(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const ListTile(
              leading: Icon(Icons.error),
              title: Text('พบข้อผิดพลาด'),
            ),
            content: Text(message),
            actions: [
              ElevatedButton(
                  onPressed: (() {
                    Navigator.of(context).pop();
                  }),
                  child: const Text('ปิด'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: Container(
          alignment: Alignment.center,
          width: size.width,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'UTC Register',
                  style: TextStyle(fontSize: 50),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.alternate_email,
                      color: Colors.deepPurple,
                      size: size.height * 0.04,
                    ),
                    labelText: 'E - Mail',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.key,
                        color: Colors.deepPurple,
                        size: size.height * 0.04,
                      ),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value;
                    }),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.fromLTRB(120, 20, 120, 20),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Register'),
                  onPressed: () => {
                    if (_formKey.currentState!.validate())
                      {
                        _formKey.currentState!.save(),
                        registerFirebase(email, password),
                        // local = DBLocal(),
                        // local.register(name, email, password),
                        // print(
                        //     "Name : $name , Email : $email , Password : $password"),
                        _formKey.currentState!.reset(),
                        Navigator.pushNamed(context, '/login')
                      },
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
