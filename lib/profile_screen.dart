import 'package:flutter/material.dart';
import 'package:mmapp/data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isTablet = constraints.maxWidth >= 600;

      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('km', style: TextStyle(color: const Color(0xFFE11D48), fontWeight: FontWeight.bold, fontSize: isTablet ? 32 : 28)),
            actions: [
              IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.search, size: 18),
                  label: const Text('Search'),
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: const Color(0xFFE11D48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ],
            bottom: const TabBar(tabs: [Tab(text: 'Your Region'), Tab(text: 'All India')], indicatorColor: Color(0xFFE11D48), labelColor: Color(0xFFE11D48), unselectedLabelColor: Colors.grey),
          ),
          // SafeArea prevents the body from drawing under the HomeScreen's BottomAppBar
          body: const SafeArea(
            top: false,
            child: TabBarView(children: [ProfileCardViewer(), ProfileCardViewer()]),
          ),
        ),
      );
    });
  }
}

class ProfileCardViewer extends StatefulWidget {
  const ProfileCardViewer({super.key});

  @override
  _ProfileCardViewerState createState() => _ProfileCardViewerState();
}

class _ProfileCardViewerState extends State<ProfileCardViewer> {
  final PageController _pageController = PageController();

  void _nextPage() {
    _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _previousPage() {
    _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final orientation = MediaQuery.of(context).orientation;
      final isTablet = constraints.maxWidth >= 600;

      if (orientation == Orientation.landscape) {
        return _buildLandscapeLayout(isTablet);
      }
      return _buildPortraitLayout(isTablet);
    });
  }

  Widget _buildPortraitLayout(bool isTablet) {
    // A SingleChildScrollView is the correct way to prevent overflow in a Column.
    return SingleChildScrollView(
      padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildInfoBox(isTablet),
          const SizedBox(height: 16),
          // A PageView inside a SingleChildScrollView needs a constrained height.
          // Using Expanded here would cause an error.
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: _buildPageView(isTablet),
          ),
          const SizedBox(height: 16),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout(bool isTablet) {
    return Row(
      children: [
        Expanded(
          flex: isTablet ? 3 : 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildPageView(isTablet),
          ),
        ),
        Expanded(
          flex: isTablet ? 2 : 3,
          // This right-side column in a Row can overflow on short screens, so it must be scrollable.
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildInfoBox(isTablet),
                const SizedBox(height: 20),
                _buildActionButtons(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoBox(bool isTablet) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(fontSize: isTablet ? 18 : 14, color: Colors.black87),
          children: const <TextSpan>[
            TextSpan(text: 'For free members, we reveal who liked '),
            TextSpan(text: '❤', style: TextStyle(color: Color(0xFFE11D48))), TextSpan(text: ' you.'),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView(bool isTablet) {
    return PageView.builder(
      controller: _pageController,
      itemCount: dummyProfiles.length,
      itemBuilder: (context, index) {
        final profile = dummyProfiles[index];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.network(profile.imageUrl, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profile.id, style: TextStyle(color: Colors.white, fontSize: isTablet ? 14 : 12)),
                    Text('${profile.name}, ${profile.age}', style: TextStyle(color: Colors.white, fontSize: isTablet ? 24 : 20, fontWeight: FontWeight.bold)),
                    Text('${profile.height}, ${profile.status}', style: TextStyle(color: Colors.white, fontSize: isTablet ? 16 : 14)),
                    Text(profile.profession, style: TextStyle(color: Colors.white, fontSize: isTablet ? 16 : 14)),
                    Text(profile.location, style: TextStyle(color: Colors.white, fontSize: isTablet ? 16 : 14)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(onPressed: _previousPage, backgroundColor: Colors.white, child: const Icon(Icons.close, color: Colors.red)),
        FloatingActionButton(onPressed: _nextPage, backgroundColor: Colors.white, child: const Icon(Icons.favorite, color: Colors.pink)),
      ],
    );
  }
}
