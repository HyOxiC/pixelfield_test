import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../collection/model/bottle.dart';

class BottleDetailScreen extends StatefulWidget {
  final Bottle bottle;

  const BottleDetailScreen({super.key, required this.bottle});

  @override
  State<BottleDetailScreen> createState() => _BottleDetailScreenState();
}

class _BottleDetailScreenState extends State<BottleDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _fadeController;
  late AnimationController _scaleController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..forward();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.95,
      upperBound: 1.0,
    );
    _scaleController.value = 1.0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottle = widget.bottle;

    return Scaffold(
      backgroundColor: const Color(0xFF0A141E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A141E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Genuine Bottle (Unopened)",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close, color: Colors.white),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.amber,
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.white,
          labelStyle: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: 'Details'),
            Tab(text: 'Tasting notes'),
            Tab(text: 'History'),
          ],
        ),
      ),
      body: FadeTransition(
        opacity: _fadeController,
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildDetailsTab(bottle),
            _buildTastingNotesTab(),
            _buildHistoryTab(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTapDown: (_) => _scaleController.reverse(),
          onTapUp: (_) {
            _scaleController.forward();
            // Add your button action here
          },
          child: ScaleTransition(
            scale: _scaleController,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add to my collection'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsTab(Bottle bottle) {
    final items = [
      'Distillery',
      'Region',
      'Country',
      'Type',
      'Age statement',
      'Filled',
      'Bottled',
      'Cask number',
      'ABV',
      'Size',
      'Finish',
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Hero(
            tag: 'bottle-${bottle.id}',
            child: Image.asset(bottle.imageUrl, height: 250),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '${bottle.name} ${bottle.year}',
          style: GoogleFonts.playfairDisplay(fontSize: 18, color: Colors.amber),
        ),
        Text('#${bottle.id}', style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 20),
        ...items.map((item) => _infoRow(item, 'Text')).toList(),
      ],
    );
  }

  Widget _buildTastingNotesTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(child: Image.asset('assets/images/bottle1.png', height: 200)),
        const SizedBox(height: 16),
        Text(
          'Tasting notes by Charles MacLean MBE',
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 10),
        _noteBlock('Nose'),
        _noteBlock('Palate'),
        _noteBlock('Finish'),
        const SizedBox(height: 16),
        const Divider(color: Colors.white24),
        const SizedBox(height: 10),
        Text(
          'Your notes',
          style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 10),
        _noteBlock('Nose'),
        _noteBlock('Palate'),
        _noteBlock('Finish'),
      ],
    );
  }

  Widget _buildHistoryTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _historyItem(title: 'Label', desc: 'Description\nDescription'),
        const SizedBox(height: 12),
        _historyItem(title: 'Label', desc: 'Description\nDescription'),
      ],
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white)),
          Text(value, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _noteBlock(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF15232E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '$title\nDescription\nDescription\nDescription',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _historyItem({required String title, required String desc}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2B36),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(desc, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Row(
            children: const [
              _ImageBox(),
              SizedBox(width: 8),
              _ImageBox(),
              SizedBox(width: 8),
              _ImageBox(),
            ],
          ),
        ],
      ),
    );
  }
}

class _ImageBox extends StatelessWidget {
  const _ImageBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey.shade700,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
