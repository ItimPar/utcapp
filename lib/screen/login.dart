import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                onSaved: (value) {
                  email = value!.trim();
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
                  onSaved: (value) {
                    password = value!.trim();
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
                onPressed: () => {},
              ),
            ],
          ),
        ));
  }
}
