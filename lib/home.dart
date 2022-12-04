import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/material/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Product Arena', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 50.0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Potential list for today',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Alen K.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              '16:00 Common Cold.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              'Amy P.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              '16:30 Right Arm Pam.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              'Kim H.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 5.0,
              ),
            ),
            Text(
              '16:30 Covid 19.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Tomorrow',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              'Andy A.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              '08:00 Common Cold.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              'Bell B.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              '09:30 Headcache.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              'Fiona L.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 5.0,
              ),
            ),
            Text(
              '10:10 Covid 19.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 2.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
