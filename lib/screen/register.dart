import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var name, email, password;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
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
                onSaved: (value) {
                  name = value!.trim();
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
                child: const Text('Register'),
                onPressed: () => {},
              ),
            ],
          ),
        ));
  }
}
