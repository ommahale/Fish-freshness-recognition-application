import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              "Welcome to Fish Freshness Detector",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/home')},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),
        ],
      ),
    ));
  }
}
// child: Column(
//       children: [
//         Container(
//           child: Text("hello from child1"),
//         ),
//         Container(
//           child: ElevatedButton(
//               onPressed: () => {Navigator.pushNamed(context, '/home')},
//               child: const Text('Get Started', style: TextStyle(fontSize: 18))),
//         ),
//       ],
//     ))