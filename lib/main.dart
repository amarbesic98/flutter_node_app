import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: Colors.white),
      routes: {
        '/home': (context) => const Home(),
      },
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  Future save() async {
    var res = await http.post("http://localhost:3000/signin",
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'email': user.email,
          'password': user.password
        });
    print(res.body);
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => Home()));
  }

  User user = User('', '');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(gradient: LinearGradient(colors: [Colors.white])),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Product Arena',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                                color: Colors.black45,
                                offset: Offset(1, 1),
                                blurRadius: 5)
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child: Form(
                      child: TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 14.5),
                        decoration: InputDecoration(
                            prefixIconConstraints: BoxConstraints(minWidth: 45),
                            border: InputBorder.none,
                            hintText: 'E-mail',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 14.5),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(color: Colors.white70))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is Required';
                          }

                          if (!RegExp(
                                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                              .hasMatch(value)) {
                            return 'Please enter a valid email Address';
                          }

                          return null;
                        },
                      ),
                    )),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 14.5),
                      obscureText: isPasswordVisible ? false : true,
                      decoration: InputDecoration(
                          suffixIconConstraints:
                              BoxConstraints(minWidth: 45, maxWidth: 46),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color.fromARGB(255, 42, 41, 41),
                              size: 22,
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 14.5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(color: Colors.white))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is Required';
                        }

                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black12,
                            offset: Offset(2, 2))
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Colors.green,
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/home');
                        }
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
