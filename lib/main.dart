import 'package:flutter/material.dart';

import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  runApp(RajangApp(viewModel: CruiseBookingViewModel()));
}

class RajangApp extends StatelessWidget {
  const RajangApp({super.key, required this.viewModel});

  final CruiseBookingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rajang River Cruise',
          theme: viewModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: CruiseBookingScreen(viewModel: viewModel),
        );
      },
    );
  }
}
