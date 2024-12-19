import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 120,
        vertical: 10,
      ),
      child: Container(
        color: Colors.blue,
        child: Row(
          children: [
            _navButton('HOME', true),
            _navButton('INK CARTRIDGES', false),
            _navButton('TONER CARTRIDGES', false),
            _navButton('CONTACT US', false),
            _navButton('LOGIN / REGISTER', false),
          ],
        ),
      ),
    );
  }

  Widget _navButton(String text, bool isSelected) {
    return Expanded(
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 28),
          backgroundColor: isSelected ? Colors.blue[700] : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
