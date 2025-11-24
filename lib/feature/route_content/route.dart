import 'package:flutter/material.dart';
import 'package:sale_app/feature/route_content/route_section/day/day.dart';
import 'package:sale_app/feature/route_content/route_section/map/map.dart';
import 'package:sale_app/feature/route_content/route_section/pos/survey.dart';
import 'package:sale_app/feature/route_content/route_section/profile/profile.dart';
import 'package:sale_app/feature/route_content/route_section/profile/section/document_content.dart';
import 'package:sale_app/feature/route_content/route_section/profile/section/photo_content.dart';
import 'package:sale_app/feature/route_content/route_section/week/week.dart';
import 'package:sale_app/helper/helper.dart';

class RouteContent extends StatefulWidget {
  const RouteContent({super.key});

  @override
  State<RouteContent> createState() => _RouteContentState();
}

class _RouteContentState extends State<RouteContent> {
  String selectedView = 'Day';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMainTopBar(),
        Expanded(child: _buildSelectedContent()),
      ],
    );
  }

  Widget _buildMainTopBar() {
    switch (selectedView) {
      case "Profile":
      case "Document":
      case "Photo":
        return _buildTopBarProfile();

      case "Survey":
        return _buildTopBarPos();

      default:
        return _buildTopBar();
    }
  }

  Widget _buildSelectedContent() {
    switch (selectedView) {
      case "Day":
        return Day();

      case "Week":
        return WeekCalendar();

      case "Profile":
        return Profile();

      case "Document":
        return DocumentContent();

      case "Photo":
        return Photo();

      case "Survey":
        return Survey();

      default:
        return Maps();
    }
  }

  Widget _buildTopBar() {
    return Container(
      margin: EdgeInsets.only(left: 22, right: 22),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back, size: 18),
            label: const Text('Back'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A1628),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(width: 16),
          _buildViewButton('Day'),
          _buildViewButton('Week'),
          _buildViewButton('Map'),
          const SizedBox(width: 8),
          _buildIconButton(Icons.person_outline, 'Profile', () {
            setState(() {
              selectedView = "Profile";
            });
          }),
          _buildIconButton(Icons.point_of_sale, 'POS', () {
            setState(() {
              selectedView = "Survey";
            });
          }),
          const Spacer(),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              side: const BorderSide(color: Color(0xFFE0E0E0)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Day Summary',
                style: TextStyle(color: Colors.black87)),
          ),
          const SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.phone, size: 18),
            label: const Text('Start Call'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A1628),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBarProfile() {
    return Container(
      margin: EdgeInsets.only(left: 22, right: 22),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back, size: 18),
            label: const Text('Back'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A1628),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(width: 16),
          _buildIconButton(Icons.person_outline, 'Profile', () {
            setState(() {
              selectedView = "Profile";
            });
          }),
          _buildIconButton(Icons.point_of_sale, 'Document', () {
            setState(() {
              selectedView = "Document";
            });
          }),
          _buildIconButton(Icons.point_of_sale, 'Photo', () {
            setState(() {
              selectedView = "Photo";
            });
          }),
          // const SizedBox(width: 12),
          const Spacer(),

          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.phone, size: 18),
            label: const Text('Start Call'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A1628),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBarPos() {
    return Container(
      margin: EdgeInsets.only(left: 22, right: 22),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back, size: 18),
            label: const Text('Back'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A1628),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(width: 16),
          _buildIconButton(Icons.person_outline, 'Survey', () {
            setState(() {
              selectedView = "Survey";
            });
          }),
          _buildIconButton(Icons.point_of_sale, 'Count', () {
            setState(() {
              selectedView = "Count";
            });
          }),
          _buildIconButton(Icons.point_of_sale, 'Return', () {
            setState(() {
              selectedView = "Return";
            });
          }),
          _buildIconButton(Icons.point_of_sale, 'Order', () {
            setState(() {
              selectedView = "Order";
            });
          }),
          _buildIconButton(Icons.point_of_sale, 'No-Order', () {
            setState(() {
              selectedView = "No-Order";
            });
          }),
          // const SizedBox(width: 12),
          const Spacer(),

          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.phone, size: 18),
            label: const Text('Start Call'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A1628),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewButton(String label) {
    final isSelected = selectedView == label;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedView = label;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF0A1628) : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black87,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          elevation: isSelected ? 2 : 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(label),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label, VoidCallback? onTap) {
    final isActive = selectedView == label;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: OutlinedButton.icon(
        onPressed: onTap, // <-- use your parent tap here
        icon: Icon(
          icon,
          size: 18,
          color: isActive ? Colors.white : Colors.black87,
        ),
        label: Text(
          label,
          style: TextStyle(color: isActive ? Colors.white : Colors.black87),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: isActive ? const Color(0xFF0A1628) : Colors.white,
          foregroundColor: Colors.black87,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          side: BorderSide(
              color: isActive ? Color(0xFF0A1628) : Color(0xFFE0E0E0)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
