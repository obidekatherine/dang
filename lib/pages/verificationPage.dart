import 'dart:async';

import 'package:dang/constants/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ThirdBody extends StatefulWidget {
  @override
  _ThirdBodyState createState() => _ThirdBodyState();
}

class _ThirdBodyState extends State<ThirdBody> {
  String myVerificationId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text:
                    'Tap on get code & enter verification code sent to your phone',
                style: TextStyle(
                  color: kBlue,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: 270,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: kBlack, width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: code,
                      style: TextStyle(
                        fontSize: 25,
                        color: kBlack,
                        letterSpacing: 5,
                      ),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    flex: 5,
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: GestureDetector(
                      onTap: isSending == false
                          ? () {
                              if (phone.text.isNotEmpty) {
                                final String number =
                                    selectedCountry + phone.text;
                                print(number);
                                verifyPhoneNumber(context, number);
                              }
                            }
                          : null,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(),
                        ),
                        child: Text(
                          '$getCodeText',
                          style: TextStyle(
                              color: isSending == false ? kBlue : kBlack,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {},
              child: Text(
                'Resend code',
                style: TextStyle(
                  color: kBlue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kBlue,
                minimumSize: Size(300, 50),
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: isLoading == false
                  ? () {
                      if (code.text.isNotEmpty) {
                        verifySmsCode(context, code.text.trim());
                      }
                    }
                  : null,
              child: isLoading == false
                  ? Text(
                      'Continue',
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : Text('Loading.....'),
            ),
          ],
        ),
      ),
    );
  }

  void verifyPhoneNumber(BuildContext context, String phone) async {
    int duration = 90;
    codeTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        isSending = true;
        if (duration < 1) {
          codeTimer.cancel();
          isSending = false;
          getCodeText = 'Get Code';
        } else {
          duration--;
          getCodeText = '$duration s';
        }
      });
    });
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        Navigator.pushNamed(context, '/nav');
      },
      timeout: Duration(seconds: 90),
      verificationFailed: (FirebaseException error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid Code')));
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        setState(() {
          myVerificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) => null,
    );
  }

  void verifySmsCode(BuildContext context, String code) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    setState(() {
      isLoading = true;
    });
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: myVerificationId, smsCode: code);
    await auth.signInWithCredential(credential);
    setState(() {
      isLoading = false;
    });
    Navigator.pushNamed(context, '/nav');
  }
}
