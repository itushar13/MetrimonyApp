import 'package:flutter/material.dart';
import 'package:mmapp/data.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isTablet = constraints.maxWidth >= 600;

      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {}),
            title: Text('Inbox', style: TextStyle(fontSize: isTablet ? 22 : 18)),
            bottom: const TabBar(
              tabs: [Tab(text: 'Chats'), Tab(text: 'Calls')],
              indicatorColor: Color(0xFFE11D48),
              labelColor: Color(0xFFE11D48),
              unselectedLabelColor: Colors.grey,
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                _buildChatList(isTablet),
                _buildCallList(isTablet),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildChatList(bool isTablet) {
    return ListView.builder(
      itemCount: dummyChats.length,
      itemBuilder: (context, index) {
        final chat = dummyChats[index];
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(chat.imageUrl), radius: isTablet ? 32 : 28),
          title: Text(chat.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: isTablet ? 18 : 16)),
          subtitle: Text(chat.message, style: TextStyle(fontSize: isTablet ? 16 : 14)),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(chat.time, style: TextStyle(fontSize: isTablet ? 14 : 12)),
              if (chat.unreadCount > 0)
                CircleAvatar(
                  radius: isTablet ? 12 : 10,
                  backgroundColor: const Color(0xFFE11D48),
                  child: Text(chat.unreadCount.toString(), style: TextStyle(color: Colors.white, fontSize: isTablet ? 14 : 12)),
                ),
            ],
          ),
          onTap: () {},
        );
      },
    );
  }

  Widget _buildCallList(bool isTablet) {
    return ListView.builder(
      itemCount: dummyCalls.length,
      itemBuilder: (context, index) {
        final call = dummyCalls[index];
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(call.imageUrl), radius: isTablet ? 32 : 28),
          title: Text(call.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: isTablet ? 18 : 16)),
          subtitle: Row(
            children: [
              Icon(
                call.type == CallType.incoming ? Icons.call_received : call.type == CallType.outgoing ? Icons.call_made : Icons.call_missed,
                color: call.type == CallType.missed ? Colors.red : Colors.green,
                size: isTablet ? 20 : 16,
              ),
              const SizedBox(width: 8),
              Text(call.time, style: TextStyle(color: Colors.grey, fontSize: isTablet ? 16 : 14)),
            ],
          ),
          trailing: IconButton(icon: const Icon(Icons.call), onPressed: () {}),
          onTap: () {},
        );
      },
    );
  }
}
