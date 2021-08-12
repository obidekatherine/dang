import 'package:dang/constants/const.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxlines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({
    Key? key,
    this.maxlines = 1,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            widget.label,
            style: TextStyle(
                color: kBlack, fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kBlack, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kBlack, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
          ),
          controller: controller,
          maxLines: widget.maxlines,
        ),
      ],
    );
  }
}
