import 'package:flutter/material.dart';
import '../components/space_item.dart';
import '../data/dummy_data.dart';

class SpacesScreen extends StatelessWidget {
  const SpacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(178, 226, 163, 238),
        title: const Text(
          "Faça Sua Reserva!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 234, 234),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 245,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: DUMMY_SPACES.length,
          itemBuilder: (ctx, index) {
            return SpaceItem(DUMMY_SPACES[index]);
          },
        ),
      ),
    );
  }
}
