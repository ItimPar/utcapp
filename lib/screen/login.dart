import 'package:flutter/material.dart';
import 'package:utcapp/localStorage/database.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var email, password;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
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
                  'UTC Login',
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
                  child: const Text('Login'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      var local = DBLocal();
                      local.login(email, password).then((value) {
                        if (value) {
                          _formKey.currentState!.reset();
                          Navigator.pushNamed(context, '/dashboard');
                        } else {
                          print('Fail');
                          final bar = SnackBar(content: Text("ไม่พบข้อมูล"));
                          ScaffoldMessenger.of(context).showSnackBar(bar);
                        }
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
