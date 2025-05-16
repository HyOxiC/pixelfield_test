import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../logic/collection_bloc.dart';
import '../logic/collection_state.dart';
import 'bottle_card.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A141E),
      appBar: AppBar(
        title: Text(
          'My collection',
          style: GoogleFonts.playfairDisplay(fontSize: 22, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0A141E),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      body: BlocBuilder<CollectionBloc, CollectionState>(
        builder: (context, state) {
          if (state is CollectionLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CollectionLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.bottles.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.58,
              ),
              itemBuilder: (_, index) {
                final bottle = state.bottles[index];
                return GestureDetector(
                  onTap: () => context.push('/collection/detail', extra: bottle),
                  child: BottleCard(bottle: bottle),
                );
              },
            );
          } else if (state is CollectionError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Something went wrong.',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0A141E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Collection',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {},
      ),
    );
  }
}
