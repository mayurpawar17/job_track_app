import 'package:fl_chart/fl_chart.dart'; // Add fl_chart: ^0.66.0 to pubspec.yaml
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _buildHeader(),
              // const SizedBox(height: 24),
              const Text(
                'Executive Summary',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF001D4D),
                ),
              ),
              const SizedBox(height: 16),
              _buildSummaryGrid(),
              const SizedBox(height: 24),
              _buildApplicationStatusCard(),
              const SizedBox(height: 24),
              _buildMonthlyActivityCard(),
              const SizedBox(height: 24),
              _buildLatestConversionsCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.menu, color: Color(0xFF001D4D)),
        const Text(
          'Analytics',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF001D4D),
          ),
        ),
        const CircleAvatar(
          backgroundColor: Color(0xFFFFDAB9),
          child: Text('👨‍💻', style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }

  Widget _buildSummaryGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.4,
      children: [
        _statCard(
          'TOTAL APPLIED',
          '42',
          Icons.description,
          const Color(0xFF004ECC),
        ),
        _statCard('INTERVIEWS', '12', Icons.forum, const Color(0xFF005221)),
        _statCard('OFFERS', '3', Icons.emoji_events, const Color(0xFF005221)),
        _statCard('REJECTIONS', '8', Icons.cancel, const Color(0xFFD32F2F)),
      ],
    );
  }

  Widget _statCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Icon(icon, color: color.withOpacity(0.8), size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationStatusCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Application Status',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Pipeline distribution',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 60,
                    sections: [
                      PieChartSectionData(
                        color: const Color(0xFF003EB3),
                        value: 60,
                        showTitle: false,
                        radius: 25,
                      ),
                      PieChartSectionData(
                        color: const Color(0xFF004D2C),
                        value: 15,
                        showTitle: false,
                        radius: 25,
                      ),
                      PieChartSectionData(
                        color: const Color(0xFFB31B1B),
                        value: 25,
                        showTitle: false,
                        radius: 25,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '78%',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'ACTIVE',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[500],
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyActivityCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Monthly Activity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Last 6 Months ▾',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Add your BarChart logic here using fl_chart
          Container(
            height: 150,
            color: Colors.transparent,
            child: const Center(child: Text("Bar Chart Placeholder")),
          ),
        ],
      ),
    );
  }

  Widget _buildLatestConversionsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF).withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Latest Conversions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.filter_list),
            ],
          ),
          const SizedBox(height: 16),
          _conversionTile(
            'Linear',
            'Product Designer',
            'APPLIED',
            'INTERVIEW',
            'Today',
          ),
          _conversionTile(
            'Supabase',
            'Growth Lead',
            'INTERVIEW',
            'OFFER',
            '2 days ago',
          ),
        ],
      ),
    );
  }

  Widget _conversionTile(
    String company,
    String role,
    String from,
    String to,
    String date,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const FlutterLogo(size: 32), // Placeholder for company logos
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    company,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    role,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            _badge(from, Colors.blue[100]!, Colors.blue[800]!),
            const Icon(Icons.arrow_right_alt, size: 16),
            _badge(to, Colors.green[100]!, Colors.green[800]!),
          ],
        ),
      ),
    );
  }

  Widget _badge(String text, Color bg, Color textC) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textC,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 2,
      selectedItemColor: const Color(0xFF004ECC),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Applications'),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Analytics',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
