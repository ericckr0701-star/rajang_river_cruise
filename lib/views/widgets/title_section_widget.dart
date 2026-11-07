import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  const TitleSectionWidget({
    super.key,
    required this.name,
    required this.location,
    required this.starCount,
    required this.onStarTap,
  });

  final String name;
  final String location;
  final int starCount;
  final VoidCallback onStarTap;

  @override
  Widget build(BuildContext context) {
    final subtitleColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 4),
                Text(location, style: TextStyle(color: subtitleColor)),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Add star',
            onPressed: onStarTap,
            icon: const Icon(Icons.star, color: Colors.amber),
          ),
          Text('$starCount', style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
