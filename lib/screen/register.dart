import 'package:flutter/material.dart';
import 'package:utcapp/localStorage/database.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String? name, email, password;
    var local;

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
                      Icons.people,
                      color: Colors.deepPurple,
                      size: size.height * 0.04,
                    ),
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value;
                  },
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
                        local = DBLocal(),
                        local.register(name, email, password),
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
