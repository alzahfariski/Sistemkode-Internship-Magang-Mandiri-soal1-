import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Franchise Opportunities'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Help'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Feedback'),
              ),
            ],
          ),
          const Row(
            children: [
              Text('alzahfariski@email.com'),
              SizedBox(width: 20),
              Text('0822 4328 3356'),
            ],
          ),
        ],
      ),
    );
  }
}
