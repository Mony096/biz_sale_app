import 'package:flutter/material.dart';

class SyncContent extends StatefulWidget {
  const SyncContent({super.key});

  @override
  State<SyncContent> createState() => _SyncContentState();
}

class _SyncContentState extends State<SyncContent> {
  String selectedTab = 'Product';
  DateTime startDate = DateTime(2025, 6, 9);
  DateTime endDate = DateTime(2025, 7, 9);
  String searchQuery = '';
  int currentPage = 1;
  int itemsPerPage = 10;
  final List<Map<String, dynamic>> allOrders = [
    {
      'date': '09/06/2025',
      'orderNumber': '000001',
      'customerName': 'Customer A',
      'qty': 100,
      'price': 100.00,
      'status': 'Pending'
    },
    {
      'date': '09/06/2025',
      'orderNumber': '000002',
      'customerName': 'Customer B',
      'qty': 100,
      'price': 100.00,
      'status': 'Done'
    },
    {
      'date': '09/06/2025',
      'orderNumber': '000003',
      'customerName': 'Customer C',
      'qty': 200,
      'price': 200.00,
      'status': 'Cancel'
    },
    {
      'date': '09/06/2025',
      'orderNumber': '000004',
      'customerName': 'Customer D',
      'qty': 200,
      'price': 200.00,
      'status': 'Pending'
    },
    {
      'date': '09/06/2025',
      'orderNumber': '000005',
      'customerName': 'Customer E',
      'qty': 300,
      'price': 300.00,
      'status': 'Done'
    },
    {
      'date': '09/06/2025',
      'orderNumber': '000006',
      'customerName': 'Customer F',
      'qty': 300,
      'price': 300.00,
      'status': 'Cancel'
    },
    {
      'date': '09/06/2025',
      'orderNumber': '000007',
      'customerName': 'Customer G',
      'qty': 150,
      'price': 150.00,
      'status': 'Pending'
    },
    {
      'date': '09/06/2025',
      'orderNumber': '000008',
      'customerName': 'Customer H',
      'qty': 250,
      'price': 250.00,
      'status': 'Done'
    },
    {
      'date': '09/06/2025',
      'orderNumber': '000009',
      'customerName': 'Customer I',
      'qty': 180,
      'price': 180.00,
      'status': 'Pending'
    },
    {
      'date': '09/06/2025',
      'orderNumber': '000010',
      'customerName': 'Customer J',
      'qty': 220,
      'price': 220.00,
      'status': 'Done'
    },
    {
      'date': '09/06/2025',
      'orderNumber': '000011',
      'customerName': 'Customer K',
      'qty': 120,
      'price': 120.00,
      'status': 'Cancel'
    },
    {
      'date': '09/06/2025',
      'orderNumber': '000012',
      'customerName': 'Customer L',
      'qty': 280,
      'price': 280.00,
      'status': 'Pending'
    },
    {
      'date': '09/06/2025',
      'orderNumber': '000013',
      'customerName': 'Customer M',
      'qty': 190,
      'price': 190.00,
      'status': 'Done'
    },
    {
      'date': '09/06/2025',
      'orderNumber': '000014',
      'customerName': 'Customer N',
      'qty': 210,
      'price': 210.00,
      'status': 'Cancel'
    },
    {
      'date': '09/06/2025',
      'orderNumber': '000015',
      'customerName': 'Customer O',
      'qty': 160,
      'price': 160.00,
      'status': 'Pending'
    },
  ];
  List<Map<String, dynamic>> get filteredOrders {
    return allOrders.where((order) {
      final matchesSearch = searchQuery.isEmpty ||
          order['customerName']
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          order['orderNumber']
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
      return matchesSearch;
    }).toList();
  }

  List<Map<String, dynamic>> get paginatedOrders {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    return filteredOrders.sublist(
      startIndex,
      endIndex > filteredOrders.length ? filteredOrders.length : endIndex,
    );
  }

  int get totalPages => (filteredOrders.length / itemsPerPage).ceil();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTopBar(),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 22, right: 22, bottom: 10, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // _buildHeader(),
                const Text(
                  'Sync Log',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Expanded(child: _buildOrderTable()), // ✅ now works
                const SizedBox(height: 10),
                _buildPagination(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      margin: EdgeInsets.only(left: 22, right: 22),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
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
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A1628),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Resync Data'),
                SizedBox(width: 8),
                Icon(Icons.keyboard_arrow_right, size: 20),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOrderTable() {
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
      child: Column(
        children: [
          _buildTableHeader(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero, // remove default padding
              itemCount: paginatedOrders.length,
              itemBuilder: (context, index) {
                return _buildTableRow(paginatedOrders[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
      ),
      child: Row(
        children: [
          _buildHeaderCell('Customer Name', 200),
          _buildHeaderCell('Type', 100),
          _buildHeaderCell('Date', 120),
          _buildHeaderCell('Status', 120),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String title, double width) {
    return SizedBox(
      width: width,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildTableRow(Map<String, dynamic> order) {
    Color statusColor;
    switch (order['status']) {
      case 'Done':
        statusColor = Colors.green;
        break;
      case 'Pending':
        statusColor = Colors.orange;
        break;
      case 'Cancel':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF5F5F5))),
      ),
      child: Row(
        children: [
          _buildCell(order['customerName'], 200),
          _buildCell(order['qty'].toString(), 100),
          _buildCell('\$ ${order['price'].toStringAsFixed(2)}', 120),
          SizedBox(
            width: 120,
            child: Text(
              order['status'],
              style: const TextStyle(fontSize: 14),
            ),
          ),
          InkWell(
            onTap: () {
              _showDeleteDialog(order);
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Icon(Icons.close, size: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCell(String text, double width) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  void _showDeleteDialog(Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Order'),
        content: Text(
            'Are you sure you want to delete order ${order['orderNumber']}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                allOrders.remove(order);
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: currentPage > 1
              ? () {
                  setState(() {
                    currentPage--;
                  });
                }
              : null,
          icon: const Icon(Icons.chevron_left),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(width: 8),
        ...List.generate(totalPages > 5 ? 5 : totalPages, (index) {
          int pageNumber;
          if (totalPages <= 5) {
            pageNumber = index + 1;
          } else if (currentPage <= 3) {
            pageNumber = index + 1;
          } else if (currentPage >= totalPages - 2) {
            pageNumber = totalPages - 4 + index;
          } else {
            pageNumber = currentPage - 2 + index;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _buildPageButton(pageNumber),
          );
        }),
        if (totalPages > 5) ...[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text('...', style: TextStyle(fontSize: 16)),
          ),
          _buildPageButton(totalPages),
        ],
        const SizedBox(width: 8),
        IconButton(
          onPressed: currentPage < totalPages
              ? () {
                  setState(() {
                    currentPage++;
                  });
                }
              : null,
          icon: const Icon(Icons.chevron_right),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageButton(int pageNumber) {
    final isActive = pageNumber == currentPage;
    return InkWell(
      onTap: () {
        setState(() {
          currentPage = pageNumber;
        });
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF0A1628) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE0E0E0)),
        ),
        child: Center(
          child: Text(
            pageNumber.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
