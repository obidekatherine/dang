import 'package:dang/constants/const.dart';
import 'package:flutter/material.dart';

class SecondBody extends StatefulWidget {
  const SecondBody({Key? key}) : super(key: key);

  @override
  _SecondBodyState createState() => _SecondBodyState();
}

class _SecondBodyState extends State<SecondBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter Your Phone Number',
              style: TextStyle(
                color: kBlack,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Confirm Your Country Code And Enter Your Phone Number',
                style: TextStyle(
                  color: kBlack,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 60),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(color: kBlack, width: 2.0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  DropdownButton<String>(
                    underline: Container(),
                    value: selectedCountry,
                    items: country.map((String e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value!;
                      });
                    },
                  ),
                  SizedBox(width: 5),
                  Expanded(
                      child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          showClearIcon = false;
                        } else {
                          showClearIcon = true;
                        }
                      });
                    },
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter phone number',
                      hintStyle: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  )),
                  showClearIcon == false
                      ? Text('')
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              phone.clear();
                              showClearIcon = false;
                            });
                          },
                          icon: Icon(Icons.close),
                          iconSize: 15),
                ],
              ),
            ),
            SizedBox(height: 60),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kBlue,
                minimumSize: Size(320, 50),
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: isLoading == false
                  ? () {
                      if (phone.text.isNotEmpty) {
                        Navigator.pushNamed(context, '/2');
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
}
