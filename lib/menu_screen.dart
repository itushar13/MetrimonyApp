import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isTablet = constraints.maxWidth >= 600;

      return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {}),
          actions: [
            IconButton(icon: const Icon(Icons.edit_outlined), onPressed: () {}),
            IconButton(icon: const Icon(Icons.settings_outlined), onPressed: () {}),
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: isTablet ? 40 : 30,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: isTablet ? 50 : 40, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tushar', style: TextStyle(fontSize: isTablet ? 24 : 20, fontWeight: FontWeight.bold)),
                        Text('KM4727600', style: TextStyle(color: Colors.grey, fontSize: isTablet ? 16 : 14)),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Upgrade to Premium'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE11D48),
                            foregroundColor: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider(),
              _buildProfileMenuItem(context, isTablet, 'View/Edit My Profile', Icons.person_outline),
              _buildProfileMenuItem(context, isTablet, 'Search Profiles', Icons.search),
              _buildProfileMenuItem(context, isTablet, 'Manage My Photos', Icons.photo_library_outlined),
              _buildProfileMenuItem(context, isTablet, 'Notifications', Icons.notifications_outlined),
              _buildProfileMenuItem(context, isTablet, 'Assisted Service', Icons.support_agent),
              _buildProfileMenuItem(context, isTablet, 'Account Settings', Icons.settings_outlined),
              _buildProfileMenuItem(context, isTablet, 'Help / Support', Icons.help_outline),
              _buildProfileMenuItem(context, isTablet, 'Link a Web Device', Icons.devices_other_outlined),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildProfileMenuItem(BuildContext context, bool isTablet, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey.shade600, size: isTablet ? 28 : 24),
      title: Text(title, style: TextStyle(fontSize: isTablet ? 18 : 16)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
