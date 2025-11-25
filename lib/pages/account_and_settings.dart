import 'package:flutter/material.dart';

class AccountAndSettings extends StatefulWidget {
  const AccountAndSettings({super.key});

  @override
  State<AccountAndSettings> createState() => _AccountAndSettingsState();
}

class _AccountAndSettingsState extends State<AccountAndSettings> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(

          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF007BFF), Color(0xFF00C6FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildHeader(),
            SizedBox(
              height: 10,
            ),
            _buildItem(Icons.admin_panel_settings, 'Admin'),
            _buildItem(Icons.task, 'Available tasks'),
            _buildItem(Icons.location_on, 'Site Activities'),
            _buildItem(Icons.settings, 'Settings'),
            _buildItem(Icons.logout, 'Logout'),
          ],
        ),
      ),
      
    );

  }
}
Widget _buildHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 40, color: Colors.grey),
          ),
          SizedBox(height: 15),
          Text(
            'William G Mariko',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Rombo DC - ICT Officer',
            style: TextStyle(color: Colors.white70),
          ),
          // Text('Category: Software Development', 
          // style: TextStyle(color: Colors.white70),)
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      onTap: () {},
    );
  }
