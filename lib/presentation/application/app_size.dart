import 'package:flutter/material.dart';

extension SizeScreen on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
}
