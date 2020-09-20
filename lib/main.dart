import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      key: scaffoldKey,
      body: new Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 40.0, right: 40.0, left: 40.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
              0.1,
              0.4,
              0.7,
              0.9
            ],
                colors: [
              Colors.purple[600],
              Colors.purple[500],
              Colors.purple[300],
              Colors.purple[200],
            ])),
        child: Center(
          child: new ListView(
            shrinkWrap: true,
            children: [
              Image.asset('assets/nikelogo.png',
                  height: 50.0, color: Colors.white),
              SizedBox(
                height: 50.0,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter the username";
                            } else if (value.length < 8) {
                              return "Maximum 8 characters";
                            } else if (value.length > 8) {
                              return "Not allowed";
                            } else if (value.isNotEmpty) {
                              return null;
                            } else {}
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.account_circle,
                                color: Colors.white,
                              ),
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.white70))),
                      SizedBox(
                        height: 50.0,
                      ),
                      TextFormField(
                          obscureText: true,
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter the password";
                            }
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.white70))),
                    ],
                  )),
              SizedBox(
                height: 50.0,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [
                      0.1,
                      0.4,
                      0.7,
                      0.9
                    ],
                        colors: [
                      Colors.purple[700],
                      Colors.purple[500],
                      Colors.purple[500],
                      Colors.purple[600],
                    ])),
                child: ButtonTheme(
                  buttonColor: Colors.transparent,
                  height: 50.0,
                  minWidth: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Form Validated Successfully")));
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new FirstPage()));
                      } else {
                        scaffoldKey.currentState.showSnackBar(
                            SnackBar(content: Text("Error in form")));
                      }
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Forgot Password ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/googlelogo.png', height: 50.0),
                  SizedBox(
                    width: 10.0,
                  ),
                  Image.asset(
                    'assets/twitter.png',
                    height: 50.0,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
      child: Text("Welcome"),
    )));
  }
}
