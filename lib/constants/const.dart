import 'dart:async';
import 'package:flutter/material.dart';

const Color kBlue = Color(0xFF002DE3);
const Color kBlack = Color(0xFF0F1828);
const Color kAsh = Color(0xFFADB5BD);
const Color kPink = Color(0xFFE76F51);
const Color kGray = Color(0xFFF7F7FC);
const Color kLightgray = Color(0xFFF7F7F);
const Color kNeutral = Color(0xFFADB5BD);
const Color kWhite = Color(0xFFFFFFFF);

String selectedCountry = '+234';

List<String> country = ['+234', '+1', '+44', '+43', '+233', '+238', '+27'];

TextEditingController phone = TextEditingController();
TextEditingController code = TextEditingController();
String getCodeText = 'Get Code';
bool isSending = false;
bool isLoading = false;
late Timer codeTimer;
bool showClearIcon = false;
