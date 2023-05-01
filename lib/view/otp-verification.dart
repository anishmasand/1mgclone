import 'package:flutter/material.dart';
import 'login_page.dart' as login;

class OtpVerification extends StatefulWidget {
  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    //var phone2 = login.phone;
    return Material(
      child: Column(children: [
        Row(
          children: [
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "Verify Mobile Number",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "A 6 digit code has been sent to",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black38,
                      ),
                    ),
                    Text(
                      "your number. ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "Change",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
