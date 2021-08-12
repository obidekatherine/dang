import 'package:dang/constants/const.dart';
import 'package:dang/utils/userpreference.dart';
import 'package:dang/widgets/editWidget.dart';
import 'package:dang/widgets/textWidget.dart';
import 'package:flutter/material.dart';

class FourthBody extends StatefulWidget {
  const FourthBody({Key? key}) : super(key: key);

  @override
  _FourthBodyState createState() => _FourthBodyState();
}

class _FourthBodyState extends State<FourthBody> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              'Your Profile',
              style: TextStyle(
                color: kBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            EditingWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            SizedBox(height: 30),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) {},
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              label: 'Phone Number',
              text: user.number,
              onChanged: (number) {},
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxlines: 5,
              onChanged: (about) {},
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kBlue,
                minimumSize: Size(300, 45),
                // padding: EdgeInsets.all(14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/nav');
              },
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 16,
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
