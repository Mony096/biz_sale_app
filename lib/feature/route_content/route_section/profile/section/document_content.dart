import 'package:flutter/material.dart';

class ContentType {
  final String name;
  final int fileCount;
  final int totalItem;
  final IconData icon;
  final Color color;

  ContentType({
    required this.name,
    required this.fileCount,
    required this.totalItem,
    required this.icon,
    required this.color,
  });
}

// Represents an individual file/document in the grid
class FileItem {
  final String title;
  final String date;
  final String size;
  final String fileType; // e.g., 'DOC', 'PDF', 'XLS'
  final String category; // New: Used for filtering against ContentType name

  FileItem({
    required this.title,
    required this.date,
    required this.size,
    required this.fileType,
    required this.category,
  });
}

// --- Main Dashboard Widget ---

class DocumentContent extends StatefulWidget {
  const DocumentContent({super.key});

  @override
  State<DocumentContent> createState() => _DocumentContentState();
}

class _DocumentContentState extends State<DocumentContent> {
  // State for tracking the currently selected category
  String _selectedType = 'Training Material';

  // The list of files currently being displayed in the grid (filtered list)
  List<FileItem> _fileItems = [];

  // Mock Data for Content Types
  final List<ContentType> _contentTypes = [
    ContentType(
        name: 'Planograms',
        fileCount: 4, // Updated count
        totalItem: 360,
        icon: Icons.description_outlined,
        color: const Color(0xFF66BB6A)), // Green
    ContentType(
        name: 'Sale Plan',
        fileCount: 2, // Updated count
        totalItem: 360,
        icon: Icons.history_edu_outlined,
        color: const Color(0xFF42A5F5)), // Blue
    ContentType(
        name: 'Planing',
        fileCount: 2, // Updated count
        totalItem: 360,
        icon: Icons.assignment_outlined,
        color: const Color(0xFFFFCA28)), // Yellow/Amber
    ContentType(
        name: 'Sale Report',
        fileCount: 4, // Updated count
        totalItem: 360,
        icon: Icons.bar_chart_outlined,
        color: const Color(0xFFEF5350)), // Red
  ];

  // Comprehensive Mock Data for all files (used for filtering)
  final List<FileItem> _allFileItems = [
    // --- Training Material (4 items) ---
    FileItem(
        title: 'Sales Mastery Guide',
        date: '12/30/2023',
        size: '15MB',
        fileType: 'DOC',
        category: 'Training Material'),
    FileItem(
        title: 'Product Catalog Overview',
        date: '12/28/2023',
        size: '20MB',
        fileType: 'PDF',
        category: 'Training Material'),
    FileItem(
        title: 'Skill Assessment Q&A',
        date: '12/25/2023',
        size: '5MB',
        fileType: 'DOC',
        category: 'Training Material'),
    FileItem(
        title: 'Onboarding Checklist',
        date: '12/20/2023',
        size: '1MB',
        fileType: 'XLS',
        category: 'Training Material'),

    // --- Selling Story (2 items) ---
    FileItem(
        title: 'Successful Deal Case Study',
        date: '11/15/2023',
        size: '10MB',
        fileType: 'PDF',
        category: 'Selling Story'),
    FileItem(
        title: 'Client Success Testimonial',
        date: '11/10/2023',
        size: '7MB',
        fileType: 'DOC',
        category: 'Selling Story'),

    // --- Plan (2 items) ---
    FileItem(
        title: 'Q4 Sales Forecast',
        date: '09/01/2023',
        size: '3MB',
        fileType: 'XLS',
        category: 'Plan'),
    FileItem(
        title: 'Territory Assignment Map',
        date: '08/20/2023',
        size: '2MB',
        fileType: 'XLS',
        category: 'Plan'),

    // --- Sale Report (4 items) ---
    FileItem(
        title: 'Monthly Performance Review',
        date: '12/01/2023',
        size: '12MB',
        fileType: 'PDF',
        category: 'Sale Report'),
    FileItem(
        title: 'Q3 Regional Analysis',
        date: '10/25/2023',
        size: '25MB',
        fileType: 'PDF',
        category: 'Sale Report'),
    FileItem(
        title: 'Year-End Summary',
        date: '01/05/2024',
        size: '30MB',
        fileType: 'PDF',
        category: 'Sale Report'),
    FileItem(
        title: 'Q1 2024 Strategy Document',
        date: '01/10/2024',
        size: '18MB',
        fileType: 'DOC',
        category: 'Sale Report'),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with the default selected type
    _filterFiles();
  }

  // --- Core Filtering Logic ---
  void _filterFiles() {
    // Filter the full list based on the currently selected category
    final filteredList =
        _allFileItems.where((item) => item.category == _selectedType).toList();

    // Update the state to rebuild the GridView with the new files
    setState(() {
      _fileItems = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    // The main Scaffold is built for a tablet/desktop view, matching the image's layout.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      // <-- Flex Widget #1 (Vertical)
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 25),
              child: Text(
                'Documents',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E1E1E),
                ),
              ),
            ),
            _buildSearchBar(),
          ],
        ),
        Expanded(
          // <-- Expanded #1 (Takes remaining vertical space)
          child: Row(
            // <-- Flex Widget #2 (Horizontal)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSidebar(),
              Expanded(
                // <-- Expanded #2 (Takes remaining horizontal space)
                child: _buildContentGrid(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Custom search bar implementation
  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.only(right: 20, top: 20),
      width: 300,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: Icon(Icons.filter_list, color: Color(0xFF192B45)),
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  // --- Left Sidebar ---

  Widget _buildSidebar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 20, top: 20),
      width: 250,
      padding: const EdgeInsets.only(left: 24, top: 5, right: 24, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _contentTypes.length,
              itemBuilder: (context, index) {
                final type = _contentTypes[index];
                return _buildTypeItem(type);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeItem(ContentType type) {
    final isSelected = _selectedType == type.name;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedType = type.name;
          _filterFiles(); // <-- Calls the filtering function
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            // Icon
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: type.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border:
                    isSelected ? Border.all(color: type.color, width: 2) : null,
              ),
              child: Icon(type.icon, color: type.color, size: 30),
            ),
            const SizedBox(width: 12),
            // Text Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected
                        ? const Color(0xFF1E1E1E)
                        : Colors.grey.shade700,
                  ),
                ),
                Text(
                  '${type.totalItem} Items',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${type.fileCount} Files',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- Main Content Grid ---

  // --- Main Content Grid ---

  Widget _buildContentGrid() {
    // REMOVE the Expanded widget from here.
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
      child: GridView.builder(
        // Use the filtered list here
        itemCount: _fileItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Display 3 columns
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 3.5, // Make cards wide and short
        ),
        itemBuilder: (context, index) {
          return _buildFileCard(_fileItems[index]);
        },
      ),
    );
  }

  // --- File Card Implementation ---

  Widget _buildFileCard(FileItem item) {
    Color cardColor;
    String fileText;

    // Determine color and label based on file type
    switch (item.fileType) {
      case 'DOC':
        cardColor = const Color(0xFF42A5F5); // Blue
        fileText = 'DOC';
        break;
      case 'PDF':
        cardColor = const Color(0xFFEF5350); // Red
        fileText = 'PDF';
        break;
      case 'XLS':
        cardColor = const Color(0xFF66BB6A); // Green
        fileText = 'XLS';
        break;
      default:
        cardColor = Colors.grey;
        fileText = 'FILE';
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // File Icon (Left side)
          Container(
            width: 70,
            height: double.infinity,
            decoration: BoxDecoration(
              color: cardColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.insert_drive_file, color: cardColor, size: 28),
                Text(
                  fileText,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: cardColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 7),

          // Details (Center)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E1E1E),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Row(
                //   children: [
                //     Text(
                //       item.date,
                //       style:
                //           TextStyle(fontSize: 13, color: Colors.grey.shade600),
                //     ),
                //     const SizedBox(width: 8),
                //     const Text(
                //       '·',
                //       style: TextStyle(fontSize: 13, color: Colors.grey),
                //     ),
                //     const SizedBox(width: 8),
                //     Text(
                //       item.size,
                //       style:
                //           TextStyle(fontSize: 13, color: Colors.grey.shade600),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),

          // // Download Icon (Right side)
          // IconButton(
          //   icon: Icon(Icons.download_for_offline_outlined,
          //       color: cardColor, size: 28),
          //   onPressed: () {
          //     // Handle download action
          //   },
          // ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
