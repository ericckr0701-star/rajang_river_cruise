import 'package:flutter/material.dart';

import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatelessWidget {
  const BookingControlsWidget({super.key, required this.viewModel});

  final CruiseBookingViewModel viewModel;

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  Future<void> _pickDate(BuildContext context) async {
    final today = DateTime.now();
    final firstDate = DateTime(today.year, today.month, today.day);
    final initialDate = viewModel.visitDate.isBefore(firstDate)
        ? firstDate
        : viewModel.visitDate;

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      viewModel.setVisitDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trip Preferences', style: Theme.of(context).textTheme.titleMedium),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Visit Date'),
            subtitle: Text(_formatDate(viewModel.visitDate)),
            trailing: const Icon(Icons.calendar_today),
            onTap: () => _pickDate(context),
          ),
          Row(
            children: [
              const Text('Cruise Package'),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: viewModel.selectedPackage,
                  items: [
                    for (final package in CruiseBookingViewModel.packages)
                      DropdownMenuItem(value: package, child: Text(package)),
                  ],
                  onChanged: viewModel.setPackage,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(child: Text('Dark Mode')),
              Switch(
                value: viewModel.isDarkMode,
                onChanged: viewModel.setDarkMode,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
