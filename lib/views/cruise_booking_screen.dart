import 'package:flutter/material.dart';

import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/booking_controls_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  const CruiseBookingScreen({super.key, required this.viewModel});

  final CruiseBookingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sibu River Cruise & Heritage')),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          return OrientationBuilder(
            builder: (context, orientation) {
              final isLandscape = orientation == Orientation.landscape;
              final header = HeaderImageWidget(
                imageAsset: viewModel.destination.imageAsset,
                expand: isLandscape,
              );
              final details = [
                TitleSectionWidget(
                  name: viewModel.destination.name,
                  location: viewModel.destination.location,
                  starCount: viewModel.starCount,
                  onStarTap: viewModel.incrementStar,
                ),
                const ActionBarWidget(),
                DescriptionWidget(text: viewModel.destination.description),
                BookingControlsWidget(viewModel: viewModel),
              ];

              if (isLandscape) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: header),
                    Expanded(child: ListView(children: details)),
                  ],
                );
              }

              return ListView(children: [header, ...details]);
            },
          );
        },
      ),
    );
  }
}
