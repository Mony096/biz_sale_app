import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sale_app/feature/dashboard_content/dashboard.dart';
import 'package:sale_app/feature/elearning_content/elearning.dart';
import 'package:sale_app/feature/gallery_content/gallery.dart';
import 'package:sale_app/feature/middleware/presentation/bloc/authorization_bloc.dart';
import 'package:sale_app/feature/order_content/Order.dart';
import 'package:sale_app/feature/profile_content/profile.dart';
import 'package:sale_app/feature/route_content/route.dart';
import 'package:sale_app/feature/sync_content/sync.dart';
import 'package:sale_app/utilies/dialog/dialog.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;
  void _logout(BuildContext context) {
    MaterialDialog.loading(context);
    // _clearAllData();
    const timeoutDuration = Duration(milliseconds: 200);
    Future.delayed(timeoutDuration, () {
      BlocProvider.of<AuthorizationBloc>(context)
          .add(const RequestLogoutEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 1. TOP BAR (Full width)
          _buildTopBar(),

          // 2. SIDEBAR + MAIN CONTENT
          Expanded(
            child: Row(
              children: [
                // Sidebar
                _buildSidebar(),

                // Main Content
                Expanded(
                  child: _getSelectedScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Dynamic content based on selected menu
  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return DashboardContent();
      case 1:
        return RouteContent();
      case 2:
        return GalleryContent();
      case 3:
        return OrderContent();
      case 4:
        return ELearningContent();
      case 5:
        return SyncContent();
      case 6:
        return ProfileContent();
      default:
        return DashboardContent();
    }
  }

  Widget _buildSidebar() {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      // color: const Color(0xFF0A1628),
      child: ListView(
        padding: const EdgeInsets.only(top: 13),
        children: [
          _buildSidebarItem(Icons.dashboard, 'Dashboard', 0),
          _buildSidebarItem(Icons.route, 'Routes', 1),
          _buildSidebarItem(Icons.photo_library, 'Gallery', 2),
          _buildSidebarItem(Icons.shopping_bag, 'Orders', 3),
          _buildSidebarItem(Icons.school, 'E-Learning', 4),
          _buildSidebarItem(Icons.sync, 'Sync', 5),
          _buildSidebarItem(Icons.person, 'Profile', 6),

          // const SizedBox(height: 10), // takes place of Spacer()

          _buildSidebarItem(Icons.logout, 'Log Out', 7, isLogout: true),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String label, int index,
      {bool isLogout = false}) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        if (isLogout) {
          _showLogoutDialog();
        } else {
          setState(() => _selectedIndex = index);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          // color: isSelected ? Colors.blue.shade700 : Colors.transparent,
          color: isSelected
              ? const Color.fromARGB(255, 236, 238, 239)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              // color: isLogout ? Colors.red.shade300 : Colors.white,
              color: isLogout ? Colors.red.shade300 : Color(0xFF0A1628),

              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                // color: isLogout ? Colors.red.shade300 : Colors.white,
                color: isLogout ? Colors.red.shade300 : Color(0xFF0A1628),

                fontSize: 12.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              _logout(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF0A1628),
        border: Border(bottom: BorderSide(color: Color(0xFF1E293B), width: 1)),
      ),
      child: Row(
        children: [
          const Text(
            'Welcome, Richa',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child:
                const Icon(Icons.photo_camera, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.chat_bubble_outline,
                color: Colors.white, size: 18),
          ),
          const Spacer(),
          Text(
            '11:49 am  Thu, 18 Sep',
            style:
                TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
          ),
          const SizedBox(width: 16),
          Text(
            '24°C',
            style:
                TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
          ),
          const SizedBox(width: 8),
          Icon(Icons.wb_sunny, color: Colors.yellow.shade600, size: 20),
        ],
      ),
    );
  }
}
