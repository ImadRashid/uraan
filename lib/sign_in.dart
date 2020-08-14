import 'package:flutter/material.dart';
import 'package:uraan_app/admin.dart';
import 'package:uraan_app/sign_up.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'member.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController(); 
  TextEditingController emailController = TextEditingController();


  static const uraanColor = 0xff7ABA7B;
  String msg = '';
  String username = '';

  Future<List> _login() async {

  String name = nameController.text;
  String email = emailController.text;
  String password = passwordController.text;

  // SERVER API URL
  var url = 'https://www.imadrashid.codes/uraan/login_final.php';
  //Data
  var data = {'email': email, 'password' : password};
  // Starting Web API Call.
  var response = await http.post(url, body: json.encode(data));

    // final response =
    //     await http.post("https://www.imadrashid.codes/uraan/login.php", body: {
    //   "username": nameController.text,
    //   "password": passwordController.text,
    // });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } 
    else {
      print("Login Succesful");
      print(response.body);
      print(datauser);
      if (datauser[0]['role'] == 'admin') {
        Navigator.push(context, MaterialPageRoute(builder: (contex)=> AdminScreen()));
      } 
      else if (datauser[0]['role'] == 'member') {
        Navigator.push(context, MaterialPageRoute(builder: (contex)=> MemberScreen()));
      }

      setState(() {
        username = datauser[0]['email'];
      });
    
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color(uraanColor),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Uraan Changing Perspectives',
                  style: TextStyle(
                      color: Color.fromARGB(255, 122, 186, 123),
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                //forgot password screen
              },
              textColor: Color.fromARGB(255, 122, 186, 123),
              child: Text('Forgot Password'),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Color.fromARGB(255, 122, 186, 123),
                  child: Text('Login'),
                  onPressed: () {
                    // print(emailController.text);
                    // print(passwordController.text);
                    _login();
                  },
                )),
            Container(
              child: Row(
                children: <Widget>[
                  Text('Don\'t have account?'),
                  FlatButton(
                    textColor: Color.fromARGB(255, 122, 186, 123),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      // SignUp();
                      //signup screen
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)
          ],
        ),
      ),
    );
  }
}