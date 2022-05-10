import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'Model/GlobalVariable.dart';
import 'Model/VotePage.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  TextEditingController studentSchoolIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var _passwordVisilble = false;

  void _btnLogin(String StudentSchoolID, String Password) async {
    Timer(const Duration(seconds: 3), () async {
      var uri = 'http://raroacc1-001-site1.dtempurl.com/api/StudentLogin';
      try {
        Response response = await post(Uri.parse(uri), body: {
          'StudentSchoolID': StudentSchoolID,
          'Password': Password,
        });
        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);

          userID = json["UserID"];
          print(json);

          _btnController.success();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Votepage()),
                (Route<dynamic> route) => false,
          );
        } else {
          _btnController.error();
        }
      } catch (e) {
        print(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 75,
            ),
            const Image(
              image: AssetImage(
                'Assets/pngegg.png',
              ),
              height: 200,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Username",
                  fillColor: Colors.white70),
              controller: studentSchoolIDController,
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
              obscureText: _passwordVisilble,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(_passwordVisilble
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                          _passwordVisilble = !_passwordVisilble;
                        },
                      );
                    },
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Password",
                  fillColor: Colors.white70),
              controller: passwordController,
            ),
            const SizedBox(
              height: 25,
            ),
            RoundedLoadingButton(
              child: const Text('LOGIN!', style: TextStyle(color: Colors.white)),
              controller: _btnController,
              onPressed: (){
                _btnLogin(studentSchoolIDController.text.toString(), passwordController.text.toString());
              },
              resetAfterDuration: true,
              resetDuration: const Duration(seconds: 6),
            )
          ],
        ),
      ),
    );
  }
}
