import 'package:flutter/material.dart';
import 'package:new_project/background.dart';

import '../constants.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  //form key
  final _formkey = GlobalKey<FormState>();

  // editing Controller
  final resetPasswordEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    //Reset Password
    final resetPasswordField = TextFormField(
      autofocus: false,
      controller: resetPasswordEditingController,
      //obscureText: true,
      //validator: () {},
      onSaved: (value){
        resetPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "New Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Confirm Password
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: resetPasswordEditingController,
      //obscureText: true,
      //validator: () {},
      onSaved: (value){
        resetPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Reset Button
    final resetButton = Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30),
      color: kPrimaryColor,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: Text(
          "Submit",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: kPrimaryLightColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                          child: Text(
                            "Reset Password",
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
                        SizedBox(height: 25,),
                        resetPasswordField,
                        SizedBox(height: 25,),
                        confirmPasswordField,
                        SizedBox(height: 25,),
                        resetButton,
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
