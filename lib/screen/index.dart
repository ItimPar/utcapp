import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var setSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.red,
        alignment: Alignment.center,
        width: setSize.width,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'img/logo.jpg',
                  width: setSize.width * 0.4,
                ),
                const Text(
                  "Welcome to UTC",
                  style: TextStyle(color: Colors.blue, fontSize: 25),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.fromLTRB(120, 10, 120, 10),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Login'),
                  onPressed: () => {Navigator.pushNamed(context, '/login')},
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.fromLTRB(120, 10, 120, 10),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Register'),
                  onPressed: () => {Navigator.pushNamed(context, '/register')},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
