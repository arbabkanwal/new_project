import 'package:flutter/material.dart';
import 'package:new_project/background.dart';
import 'package:new_project/constants.dart';
import 'package:new_project/screens/registration_screen.dart';
import 'package:new_project/screens/reset_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //form key
  final _formkey = GlobalKey<FormState>();

  // editing Controller
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      //validator: () {},
      onSaved: (value){
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      //obscureText: true,
      //validator: () {},
      onSaved: (value){
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //loginButton
    final loginButton = Material(
      elevation: 10,
        borderRadius: BorderRadius.circular(30),
        color: kPrimaryColor,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: Text(
            "Login",
             textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: kPrimaryLightColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Background(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: size.height * 0.03,),
                          emailField,
                          SizedBox(height: size.height * 0.03,),
                          passwordField,
                          SizedBox(
                            height: size.height * 0.03,),
                               GestureDetector(
                                 onTap: () {
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                       builder: (context) => ResetPasswordScreen(),
                                     ),
                                   );
                                 },
                                     child: Text(
                                       "Forget",
                                       textAlign: TextAlign.left,
                                       style: TextStyle(
                                         fontSize: 15,
                                         color: kPrimaryColor,
                                         fontWeight: FontWeight.bold,
                                       ),
                                  ),
                               ),
                          SizedBox(height: size.height * 0.03,),
                          loginButton,
                          SizedBox(height: size.height * 0.03,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Don't have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegistrationScreen(),
                                      ),
                                  );
                                },
                                child: Text(
                                    "Create Acoount",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
