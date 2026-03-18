import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      // appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildProfileHeader(),
            const SizedBox(height: 32),
            _buildSectionHeader('ACCOUNT SETTINGS'),
            _buildSettingsCard([
              _settingsTile(Icons.person, 'Edit Profile', onTap: () {}),
              _settingsTile(Icons.lock, 'Change Password', onTap: () {}),
            ]),
            const SizedBox(height: 24),
            _buildSectionHeader('PREFERENCES'),
            _buildSettingsCard([
              _toggleTile(
                Icons.dark_mode,
                'Dark Mode',
                isDarkMode,
                (v) => setState(() => isDarkMode = v),
              ),
              _toggleTile(
                Icons.notifications,
                'Notifications',
                notificationsEnabled,
                (v) => setState(() => notificationsEnabled = v),
              ),
            ]),
            const SizedBox(height: 24),
            _buildSectionHeader('DATA MANAGEMENT'),
            _buildSettingsCard([
              _settingsTile(
                Icons.insert_drive_file,
                'Export Job List (CSV/PDF)',
                trailing: const Icon(Icons.download, size: 20),
              ),
            ]),
            const SizedBox(height: 24),
            _buildSectionHeader('SUPPORT & LEGALS'),
            _buildSupportGrid(),
            const SizedBox(height: 32),
            Text(
              'VERSION 2.4.0 (BUILD 892)',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 24),
            _buildLogoutButton(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back, color: Color(0xFF004ECC)),
      ),
      title: const Text(
        'Profile',
        style: TextStyle(color: Color(0xFF004ECC), fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings, color: Color(0xFF001D4D)),
        ),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFF004ECC),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Alex Curator',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF001D4D),
          ),
        ),
        Text(
          'alex@jobtrack.com',
          style: TextStyle(color: Colors.blueGrey[400], fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 4, bottom: 12),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[400],
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  Widget _settingsTile(
    IconData icon,
    String title, {
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: const Color(0xFF003EB3)),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color(0xFF001D4D),
        ),
      ),
      trailing: trailing ?? Icon(Icons.chevron_right, color: Colors.grey[300]),
    );
  }

  Widget _toggleTile(
    IconData icon,
    String title,
    bool value,
    Function(bool) onChanged,
  ) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF003EB3)),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color(0xFF001D4D),
        ),
      ),
      trailing: Switch(
        value: value,
        activeColor: const Color(0xFF004ECC),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildSupportGrid() {
    return Row(
      children: [
        _supportCard(Icons.gavel, 'Terms'),
        const SizedBox(width: 16),
        _supportCard(Icons.verified_user, 'Privacy'),
      ],
    );
  }

  Widget _supportCard(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF001D4D)),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF001D4D),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFD6D6),
          foregroundColor: const Color(0xFFB30000),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.logout),
            SizedBox(width: 12),
            Text(
              'Logout',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: 3,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF004ECC),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.work), label: 'APPLICATIONS'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'SEARCH'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'INSIGHTS'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PROFILE'),
      ],
    );
  }
}
