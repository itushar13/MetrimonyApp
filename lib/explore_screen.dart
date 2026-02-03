import 'package:flutter/material.dart';

class ExploreLikesScreen extends StatelessWidget {
  const ExploreLikesScreen({super.key});

  static const Color primaryPink = Color(0xFFE11D48);
  static const Color accentPink = Color(0xFFBE185D);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isTablet = constraints.maxWidth >= 600;

      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {}),
            centerTitle: true,
            title: Text('Explore', style: TextStyle(fontSize: isTablet ? 22 : 18, fontWeight: FontWeight.w600, color: const Color(0xFF1F2937))),
            actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
          ),
          body: SafeArea(
            child: Column(
              children: [
                _buildMainTabs(context, isTablet),
                const TabBar(tabs: [Tab(text: 'Likes Received'), Tab(text: 'Like Sent'), Tab(text: 'Mutual Likes')], indicatorColor: primaryPink, labelColor: primaryPink, unselectedLabelColor: Colors.grey),
                Expanded(
                  child: TabBarView(children: [
                    _buildNoLikesReceived(context, isTablet),
                    _buildEmptyLikesList(context, isTablet, 'No Likes Sent Yet', 'Send likes to get matches faster!'),
                    _buildEmptyLikesList(context, isTablet, 'No Mutual Likes Yet', 'Like profiles to create mutual connections.'),
                  ]),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildMainTabs(BuildContext context, bool isTablet) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: isTablet ? 24.0 : 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_buildMainTab(context, isTablet, 'Likes', true), _buildMainTab(context, isTablet, 'Profile Visits', false), _buildMainTab(context, isTablet, 'Contacts Views', false)],
      ),
    );
  }

  Widget _buildMainTab(BuildContext context, bool isTablet, String text, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: isTablet ? 24.0 : 16.0),
      decoration: BoxDecoration(color: isSelected ? primaryPink.withOpacity(0.1) : Colors.transparent, borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: TextStyle(color: isSelected ? primaryPink : Colors.grey.shade700, fontWeight: FontWeight.bold, fontSize: isTablet ? 18 : 14)),
    );
  }

  Widget _buildNoLikesReceived(BuildContext context, bool isTablet) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: isTablet ? 24.0 : 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20), // Add some space at the top
          Container(width: isTablet ? 150 : 120, height: isTablet ? 150 : 120, decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle), child: Icon(Icons.favorite_border, color: Colors.grey.shade400, size: isTablet ? 70 : 56)),
          const SizedBox(height: 24),
          Text('No Likes Received Yet', textAlign: TextAlign.center, style: TextStyle(fontSize: isTablet ? 24 : 20, fontWeight: FontWeight.bold, color: accentPink)),
          const SizedBox(height: 8),
          RichText(textAlign: TextAlign.center, text: TextSpan(style: TextStyle(fontSize: isTablet ? 18 : 14, color: Colors.grey.shade700), children: const <TextSpan>[TextSpan(text: "You haven't received any likes yet "), TextSpan(text: '❤', style: TextStyle(color: primaryPink)), TextSpan(text: '. Stay active and enhance your profile to attract more attention—your likes will come soon! '), TextSpan(text: '😉✨')])),
          const SizedBox(height: 20),
          Container(width: double.infinity, padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)), child: RichText(textAlign: TextAlign.center, text: TextSpan(style: TextStyle(fontSize: isTablet ? 18 : 14, color: Colors.black87), children: const <TextSpan>[TextSpan(text: 'For free members, we reveal who liked '), TextSpan(text: '❤', style: TextStyle(color: primaryPink)), TextSpan(text: ' you.')]))),
          const SizedBox(height: 20), // Add some space at the bottom
        ],
      ),
    );
  }

  Widget _buildEmptyLikesList(BuildContext context, bool isTablet, String title, String subtitle) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20), // Add some space at the top
          Container(width: isTablet ? 150 : 120, height: isTablet ? 150 : 120, decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle), child: Icon(Icons.favorite_border, color: Colors.grey.shade400, size: isTablet ? 70 : 56)),
          const SizedBox(height: 24),
          Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: isTablet ? 24 : 20, fontWeight: FontWeight.bold, color: accentPink)),
          const SizedBox(height: 8),
          Text(subtitle, textAlign: TextAlign.center, style: TextStyle(fontSize: isTablet ? 18 : 14, color: Colors.grey.shade700)),
          const SizedBox(height: 20), // Add some space at the bottom
        ],
      ),
    );
  }
}
