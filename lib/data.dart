import 'package:flutter/material.dart';

// --- Data Models ---
class Profile {
  final String id, name, height, status, profession, location, imageUrl;
  final int age;

  const Profile({
    required this.id, required this.name, required this.age, required this.height,
    required this.status, required this.profession, required this.location, required this.imageUrl,
  });
}

class ChatItem {
  final String name, message, time;
  final int unreadCount;
  final String imageUrl;

  const ChatItem({required this.name, required this.message, required this.time, this.unreadCount = 0, required this.imageUrl});
}

enum CallType { incoming, outgoing, missed }

class CallItem {
  final String name, time;
  final CallType type;
  final String imageUrl;

  const CallItem({required this.name, required this.time, required this.type, required this.imageUrl});
}


// --- Dummy Data ---

final List<Profile> dummyProfiles = [
  const Profile(
    id: 'FR4724296',
    name: 'Priyanka Gupta',
    age: 24,
    height: '153 cm (5\'1\")',
    status: 'Single',
    profession: 'Baniya - Bania, Banking Professi...',
    location: 'Allahabad, Uttar Pradesh',
    imageUrl: 'https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=1961&auto=format&fit=crop',
  ),
  const Profile(
    id: 'FR4724212',
    name: 'Siya Patel',
    age: 25,
    height: '162 cm (5\'4\")',
    status: 'Single',
    profession: 'Kadava Patel, Banking Professio...',
    location: 'Ahmedabad, Gujarat',
    imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop',
  ),
  const Profile(
    id: 'FR4724213',
    name: 'Riya Sharma',
    age: 26,
    height: '165 cm (5\'5\")',
    status: 'Single',
    profession: 'Software Engineer',
    location: 'Bangalore, Karnataka',
    imageUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1888&auto=format&fit=crop',
  ),
  const Profile(
    id: 'FR4724214',
    name: 'Anjali Singh',
    age: 23,
    height: '160 cm (5\'3\")',
    status: 'Single',
    profession: 'Doctor',
    location: 'Mumbai, Maharashtra',
    imageUrl: 'https://images.unsplash.com/photo-1599425573458-53a611d42870?q=80&w=1887&auto=format&fit=crop',
  ),
  const Profile(
    id: 'FR4724215',
    name: 'Kavita Reddy',
    age: 27,
    height: '168 cm (5\'6\")',
    status: 'Single',
    profession: 'Lawyer',
    location: 'Hyderabad, Telangana',
    imageUrl: 'https://images.unsplash.com/photo-1557053910-d9eadeed1c58?q=80&w=1887&auto=format&fit=crop',
  ),
  const Profile(
    id: 'FR4724216',
    name: 'Pooja Mehta',
    age: 28,
    height: '157 cm (5\'2\")',
    status: 'Single',
    profession: 'Architect',
    location: 'Pune, Maharashtra',
    imageUrl: 'https://images.unsplash.com/photo-1607746882042-944635dfe10e?q=80&w=1920&auto=format&fit=crop',
  ),
  const Profile(
    id: 'FR4724217',
    name: 'Neha Desai',
    age: 25,
    height: '163 cm (5\'4\")',
    status: 'Single',
    profession: 'Chartered Accountant',
    location: 'Surat, Gujarat',
    imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=1964&auto=format&fit=crop',
  ),
  const Profile(
    id: 'FR4724218',
    name: 'Meera Iyer',
    age: 29,
    height: '155 cm (5\'1\")',
    status: 'Single',
    profession: 'Marketing Manager',
    location: 'Chennai, Tamil Nadu',
    imageUrl: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?q=80&w=1887&auto=format&fit=crop',
  ),
  const Profile(
    id: 'FR4724219',
    name: 'Sunita Rao',
    age: 26,
    height: '169 cm (5\'7\")',
    status: 'Single',
    profession: 'Business Analyst',
    location: 'Kolkata, West Bengal',
    imageUrl: 'https://images.unsplash.com/photo-1580894732444-8ec16f2a746a?q=80&w=1887&auto=format&fit=crop',
  ),
];

final List<ChatItem> dummyChats = [
  const ChatItem(name: 'Rahul Verma', message: 'Hello, how are you?', time: '10:30 AM', unreadCount: 2, imageUrl: 'https://via.placeholder.com/150'),
  const ChatItem(name: 'Aisha Khan', message: 'Let\'s catch up soon!', time: 'Yesterday', imageUrl: 'https://via.placeholder.com/150'),
];

final List<CallItem> dummyCalls = [
  const CallItem(name: 'Rohan Sharma', time: 'Today, 11:45 AM', type: CallType.incoming, imageUrl: 'https://via.placeholder.com/150'),
  const CallItem(name: 'Sneha Reddy', time: 'Yesterday, 8:30 PM', type: CallType.missed, imageUrl: 'https://via.placeholder.com/150'),
  const CallItem(name: 'Arjun Kapoor', time: '2 days ago, 3:15 PM', type: CallType.outgoing, imageUrl: 'https://via.placeholder.com/150'),
];
