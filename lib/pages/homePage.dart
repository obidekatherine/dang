import 'package:dang/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstBody extends StatefulWidget {
  @override
  _FirstBodyState createState() => _FirstBodyState();
}

class _FirstBodyState extends State<FirstBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'images/Illustration.svg',
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Connect easily with your family and friends over countries',
                style: TextStyle(
                  color: kBlack,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 70, //80
            ),
            Text(
              'Terms & Privacy Policy',
              style: TextStyle(
                color: kBlack,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kBlue,
                minimumSize: Size(300, 40),
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/1');
              },
              child: Text(
                'Start Messaging',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
