import 'package:flutter/material.dart';
import '../models/spaces.dart';
import '../screens/reservations_screen.dart';

class SpaceItem extends StatelessWidget {
  final Space space;

  const SpaceItem(this.space, {super.key});

  void _selectReservations(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return ReservationsScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectReservations(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              space.color.withOpacity(0.5),
              space.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                space.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color.fromARGB(123, 17, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                space.description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
