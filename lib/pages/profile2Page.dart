import 'package:dang/constants/const.dart';
import 'package:dang/pages/profilePage.dart';
import 'package:dang/utils/userpreference.dart';
import 'package:dang/widgets/profileWidget.dart';
import 'package:flutter/material.dart';

class FifthBody extends StatefulWidget {
  const FifthBody({Key? key}) : super(key: key);

  @override
  _FifthBodyState createState() => _FifthBodyState();
}

class _FifthBodyState extends State<FifthBody> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FourthBody()),
                );
              },
            ),
          ),
          // SizedBox(height: 5),
          Center(child: buildName(user)),
          SizedBox(height: 50),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(
              color: kBlack,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 4),
          Text(
            user.number,
            style: TextStyle(
              color: kBlack,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ],
      );

  Widget buildAbout(user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: kBlack),
            ),
            SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
