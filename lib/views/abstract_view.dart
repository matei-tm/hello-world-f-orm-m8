import 'package:flutter/material.dart';

abstract class View {
  showErrorMessage(String message);
  setState(VoidCallback fn);
}
