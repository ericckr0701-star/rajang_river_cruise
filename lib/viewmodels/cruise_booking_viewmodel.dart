import 'package:flutter/foundation.dart';

import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination = const CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description:
    'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. Cruise past historic temples, timber hubs, and waterfront settlements.',
    imageAsset: 'assets/images/rajang.jpg',
  );

  int starCount = 43;
  DateTime visitDate = DateTime(2026, 11, 15);
  String selectedPackage = 'Sunset Cruise';
  bool isDarkMode = false;

  static const List<String> packages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  void incrementStar() {
    starCount += 1;
    notifyListeners();
  }

  void setVisitDate(DateTime date) {
    visitDate = date;
    notifyListeners();
  }

  void setPackage(String? package) {
    if (package == null) return;
    selectedPackage = package;
    notifyListeners();
  }

  void setDarkMode(bool value) {
    isDarkMode = value;
    notifyListeners();
  }
}