import 'package:flutter_test/flutter_test.dart';
import 'package:rajang_river_cruise/main.dart';
import 'package:rajang_river_cruise/viewmodels/cruise_booking_viewmodel.dart';

void main() {
  testWidgets('shows the cruise title', (tester) async {
    await tester.pumpWidget(RajangApp(viewModel: CruiseBookingViewModel()));

    expect(find.text('Rajang River Express Cruise'), findsOneWidget);
    expect(find.text('Sibu River Cruise & Heritage'), findsOneWidget);
  });
}
