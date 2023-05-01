library login_page.login;

export 'login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tata_1mg/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static String phone = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 120),
                  child: Image.asset(
                    "assets/images/login-image.png",
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 10),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Sign in to continue",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    //pub.dev for installation instructions for google fonts
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "+91 Enter 10 digit mobile number"),
                    onChanged: (value) {
                      phone = value;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone number can't be empty";
                      } else if (value.length < 10) {
                        return 'Phone number should be of 10 digits.';
                      }
                      return null;
                    }),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, MyRoutes.productsRoute);
                        }
                      },
                      // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                          padding: EdgeInsets.all(15),
                          elevation: 12.0,
                          shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(3),
                          ),
                          textStyle: const TextStyle(color: Colors.white)),

                      child: const Text(
                        "Get verification code",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 40,
              ),
              Text(
                "By signing in you agree to our ",
                style: TextStyle(color: Colors.black38),
              ),
              Text(
                "terms and conditions and privacy policies",
                style: TextStyle(color: Colors.black38),
              ),

              // means the component is private
            ], //fit property:boxfit: stretch etc
          ),
        ),
      ), //main axis : row ke liye sleeping line,cross: standing line
    );
  }
}
