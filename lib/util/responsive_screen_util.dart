import 'package:flutter/material.dart';

const MockupHeight = 812;
const MockupWidth = 375;

sHeight(BuildContext context, {double? mockupHeight = 812}) {
  return (dynamic height) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * (height / mockupHeight);
  };
}

sWidth(BuildContext context) {
  return (dynamic width) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * (width / MockupWidth);
  };
}
