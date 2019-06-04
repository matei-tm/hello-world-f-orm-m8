import 'package:flutter/material.dart';

abstract class Presenter<T> {
  get isNotValid;

  List<T> get workSet;

  int get workSetLength;

  bool get needUpdate;

  Future<bool> loadCurrentData();
  Future<void> addOrUpdate();
  Future<void> edit(T h);
  void cancelUpdate();
  Future<void> delete(T h);
}

abstract class TextEditingPresenter<T> extends TextEditingController
    implements Presenter<T> {}
