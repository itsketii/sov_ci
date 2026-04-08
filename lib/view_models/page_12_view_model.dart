import 'package:flutter/material.dart';
import '../models/orientation_models.dart';

class Page12ViewModel extends ChangeNotifier {
  bool _isGuest = true;
  bool get isGuest => _isGuest;

  String? _name;
  String? _level;
  String? _school;
  String? _city;
  double? _average;
  bool _isDarkMode = false;

  String get name => _name ?? "Utilisateur";
  String get level => _level ?? "Niveau non défini";
  String get school => _school ?? "Établissement non défini";
  String get city => _city ?? "Ville non définie";
  double get average => _average ?? 0.0;
  bool get isDarkMode => _isDarkMode;

  void setGuestMode(bool value) {
    _isGuest = value;
    if (value) {
      _clearData();
    }
    notifyListeners();
  }

  void _clearData() {
    _name = null;
    _level = null;
    _school = null;
    _city = null;
    _average = null;
  }


  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void updateProfile({String? name, String? city, double? average}) {
    if (name != null) _name = name;
    if (city != null) _city = city;
    if (average != null) _average = average;
    notifyListeners();
  }
}
