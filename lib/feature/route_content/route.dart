import 'package:flutter/material.dart';

class RouteContent extends StatefulWidget {
  const RouteContent({super.key});

  @override
  State<RouteContent> createState() => _RouteContentState();
}

class _RouteContentState extends State<RouteContent> {
  int selectedCustomerIndex = 0;
  String selectedView = 'Day';

  final List<Map<String, dynamic>> customers = [
    {
      'name': 'Customer A',
      'outlet': '0001',
      'businessName': 'Pharmacy A',
      'segment': 'Gold',
      'phone': 'CXX0 123 456 789',
      'address': 'Aragon Road Adcickvale Port',
      'street': 'Elizabeth, Frash Street, No.500',
      'room': 'Room987',
      'manager': 'White Clinton',
      'position': 'Sales Manager',
      'managerPhone': '021 1256 6341',
      'email': 'White.Clinton@gmail.com',
      'orders': [
        {
          'date': '11-Jan-2022',
          'quantity': '10 CS',
          'amount': '\$ 25.00',
          'orderNo': '123456789',
          'status': 'New',
          'type': 'Sales Order'
        },
        {
          'date': '11-Jan-2022',
          'quantity': '10 CS',
          'amount': '\$ 25.00',
          'orderNo': '123456789',
          'status': 'New',
          'type': 'Sales Order'
        },
        {
          'date': '11-Jan-2022',
          'quantity': '10 CS',
          'amount': '\$ 25.00',
          'orderNo': '123456789',
          'status': 'New',
          'type': 'Sales Order'
        },
        {
          'date': '11-Jan-2022',
          'quantity': '10 CS',
          'amount': '\$ 25.00',
          'orderNo': '123456789',
          'status': 'New',
          'type': 'Sales Order'
        },
        {
          'date': '11-Jan-2022',
          'quantity': '10 CS',
          'amount': '\$ 25.00',
          'orderNo': '123456789',
          'status': 'New',
          'type': 'Sales Order'
        },
      ]
    },
    {
      'name': 'Customer B',
      'outlet': '0002',
      'businessName': 'MediCare Plus',
      'segment': 'Silver',
      'phone': 'CXX0 987 654 321',
      'address': 'Highland Avenue Central District',
      'street': 'Wellington, Main Street, No.234',
      'room': 'Suite 12',
      'manager': 'Sarah Johnson',
      'position': 'Account Manager',
      'managerPhone': '021 8765 4321',
      'email': 'Sarah.Johnson@gmail.com',
      'orders': [
        {
          'date': '10-Jan-2022',
          'quantity': '15 CS',
          'amount': '\$ 37.50',
          'orderNo': '987654321',
          'status': 'Pending',
          'type': 'Sales Order'
        },
        {
          'date': '09-Jan-2022',
          'quantity': '8 CS',
          'amount': '\$ 20.00',
          'orderNo': '987654320',
          'status': 'Completed',
          'type': 'Sales Order'
        },
        {
          'date': '08-Jan-2022',
          'quantity': '12 CS',
          'amount': '\$ 30.00',
          'orderNo': '987654319',
          'status': 'New',
          'type': 'Sales Order'
        },
      ]
    },
    {
      'name': 'Customer C',
      'outlet': '0003',
      'businessName': 'HealthHub Pharmacy',
      'segment': 'Platinum',
      'phone': 'CXX0 555 888 999',
      'address': 'Riverside Boulevard East Wing',
      'street': 'Springfield, Oak Avenue, No.789',
      'room': 'Floor 3',
      'manager': 'Michael Chen',
      'position': 'Regional Director',
      'managerPhone': '021 5558 8899',
      'email': 'Michael.Chen@gmail.com',
      'orders': [
        {
          'date': '12-Jan-2022',
          'quantity': '25 CS',
          'amount': '\$ 62.50',
          'orderNo': '555888999',
          'status': 'New',
          'type': 'Sales Order'
        },
        {
          'date': '11-Jan-2022',
          'quantity': '20 CS',
          'amount': '\$ 50.00',
          'orderNo': '555888998',
          'status': 'Processing',
          'type': 'Sales Order'
        },
        {
          'date': '10-Jan-2022',
          'quantity': '18 CS',
          'amount': '\$ 45.00',
          'orderNo': '555888997',
          'status': 'Completed',
          'type': 'Sales Order'
        },
        {
          'date': '09-Jan-2022',
          'quantity': '22 CS',
          'amount': '\$ 55.00',
          'orderNo': '555888996',
          'status': 'Completed',
          'type': 'Sales Order'
        },
      ]
    },
    {
      'name': 'Customer D',
      'outlet': '0004',
      'businessName': 'QuickMed Express',
      'segment': 'Bronze',
      'phone': 'CXX0 444 777 222',
      'address': 'Downtown Plaza West Side',
      'street': 'Riverside, Commerce St, No.456',
      'room': 'Unit 8B',
      'manager': 'Emily Rodriguez',
      'position': 'Store Manager',
      'managerPhone': '021 4447 7722',
      'email': 'Emily.Rodriguez@gmail.com',
      'orders': [
        {
          'date': '11-Jan-2022',
          'quantity': '5 CS',
          'amount': '\$ 12.50',
          'orderNo': '444777222',
          'status': 'New',
          'type': 'Sales Order'
        },
        {
          'date': '10-Jan-2022',
          'quantity': '7 CS',
          'amount': '\$ 17.50',
          'orderNo': '444777221',
          'status': 'New',
          'type': 'Sales Order'
        },
      ]
    },
    {
      'name': 'Customer E',
      'outlet': '0005',
      'businessName': 'Wellness Pharmacy',
      'segment': 'Gold',
      'phone': 'CXX0 333 666 111',
      'address': 'Northside Shopping Center',
      'street': 'Madison, Park Road, No.678',
      'room': 'Shop 15',
      'manager': 'David Kim',
      'position': 'Operations Manager',
      'managerPhone': '021 3336 6611',
      'email': 'David.Kim@gmail.com',
      'orders': [
        {
          'date': '12-Jan-2022',
          'quantity': '14 CS',
          'amount': '\$ 35.00',
          'orderNo': '333666111',
          'status': 'Processing',
          'type': 'Sales Order'
        },
        {
          'date': '11-Jan-2022',
          'quantity': '11 CS',
          'amount': '\$ 27.50',
          'orderNo': '333666110',
          'status': 'New',
          'type': 'Sales Order'
        },
        {
          'date': '10-Jan-2022',
          'quantity': '9 CS',
          'amount': '\$ 22.50',
          'orderNo': '333666109',
          'status': 'Completed',
          'type': 'Sales Order'
        },
      ]
    },
    {
      'name': 'Customer F',
      'outlet': '0006',
      'businessName': 'CareFirst Pharmacy',
      'segment': 'Silver',
      'phone': 'CXX0 222 999 444',
      'address': 'Suburban Mall Complex',
      'street': 'Lincoln, Maple Drive, No.890',
      'room': 'Ground Floor',
      'manager': 'Lisa Thompson',
      'position': 'Branch Manager',
      'managerPhone': '021 2229 9944',
      'email': 'Lisa.Thompson@gmail.com',
      'orders': [
        {
          'date': '11-Jan-2022',
          'quantity': '13 CS',
          'amount': '\$ 32.50',
          'orderNo': '222999444',
          'status': 'New',
          'type': 'Sales Order'
        },
      ]
    },
    {
      'name': 'Customer G',
      'outlet': '0007',
      'businessName': 'PrimeMed Solutions',
      'segment': 'Platinum',
      'phone': 'CXX0 111 555 888',
      'address': 'Business Park Industrial Area',
      'street': 'Jefferson, Tech Boulevard, No.123',
      'room': 'Building C',
      'manager': 'Robert Anderson',
      'position': 'VP of Sales',
      'managerPhone': '021 1115 5588',
      'email': 'Robert.Anderson@gmail.com',
      'orders': [
        {
          'date': '12-Jan-2022',
          'quantity': '30 CS',
          'amount': '\$ 75.00',
          'orderNo': '111555888',
          'status': 'New',
          'type': 'Sales Order'
        },
        {
          'date': '11-Jan-2022',
          'quantity': '28 CS',
          'amount': '\$ 70.00',
          'orderNo': '111555887',
          'status': 'Processing',
          'type': 'Sales Order'
        },
        {
          'date': '10-Jan-2022',
          'quantity': '25 CS',
          'amount': '\$ 62.50',
          'orderNo': '111555886',
          'status': 'Completed',
          'type': 'Sales Order'
        },
        {
          'date': '09-Jan-2022',
          'quantity': '26 CS',
          'amount': '\$ 65.00',
          'orderNo': '111555885',
          'status': 'Completed',
          'type': 'Sales Order'
        },
        {
          'date': '08-Jan-2022',
          'quantity': '24 CS',
          'amount': '\$ 60.00',
          'orderNo': '111555884',
          'status': 'Completed',
          'type': 'Sales Order'
        },
      ]
    },
    {
      'name': 'Customer H',
      'outlet': '0008',
      'businessName': 'FamilyCare Drugstore',
      'segment': 'Bronze',
      'phone': 'CXX0 666 333 777',
      'address': 'Community Center District',
      'street': 'Washington, Valley Road, No.345',
      'room': 'Store 22',
      'manager': 'Jennifer Lee',
      'position': 'Assistant Manager',
      'managerPhone': '021 6663 3377',
      'email': 'Jennifer.Lee@gmail.com',
      'orders': [
        {
          'date': '11-Jan-2022',
          'quantity': '6 CS',
          'amount': '\$ 15.00',
          'orderNo': '666333777',
          'status': 'New',
          'type': 'Sales Order'
        },
        {
          'date': '10-Jan-2022',
          'quantity': '8 CS',
          'amount': '\$ 20.00',
          'orderNo': '666333776',
          'status': 'Pending',
          'type': 'Sales Order'
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          _buildTopBar(),
          Expanded(
            child: Row(
              children: [
                _buildCustomerList(),
                Expanded(child: _buildCustomerDetails()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
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
          _buildIconButton(Icons.person_outline, 'Profile'),
          _buildIconButton(Icons.point_of_sale, 'POS'),
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

  Widget _buildIconButton(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black87,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          side: const BorderSide(color: Color(0xFFE0E0E0)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildCustomerList() {
    return Container(
      width: 320,
      margin: EdgeInsets.only(left: 20, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border(right: BorderSide(color: Color(0xFFE0E0E0))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Plan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.tune),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                final customer = customers[index];
                final isSelected = selectedCustomerIndex == index;
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedCustomerIndex = index;
                    });
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF0A1628)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '0${index + 1}  ${customer['name']}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Outlet ID ${customer['outlet']}',
                          style: TextStyle(
                            fontSize: 13,
                            color: isSelected ? Colors.white70 : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerDetails() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Color.fromARGB(255, 255, 255, 255),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
         
          child: const Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 28,
                      color: Color(0xFF0A1628),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Customer Info',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0A1628),
                      ),
                    ),
                  ],
                ),
              ),
               Icon(
                Icons.keyboard_arrow_down,
                size: 28,
                color: Color(0xFF0A1628),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              children: [
                _buildCustomerInfoCard(),
                const SizedBox(height: 20),
                _buildOrdersList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerInfoCard() {
    final customer = customers[selectedCustomerIndex];

    return Container(
      // margin: EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.all(24),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 140,
              height: 120,
              color: Colors.red,
              child: Image.asset(
                'assets/pharmacy.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.store, size: 48, color: Colors.white),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customer['businessName'],
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('Segment: ${customer['segment']}',
                    style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 4),
                Text(customer['phone'], style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 4),
                Text(customer['address'], style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 4),
                Text(customer['street'], style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 4),
                Text(customer['room'], style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(customer['manager'],
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 4),
              Text(customer['position'],
                  style: const TextStyle(fontSize: 13, color: Colors.grey)),
              const SizedBox(height: 4),
              Text(customer['managerPhone'],
                  style: const TextStyle(fontSize: 13)),
              const SizedBox(height: 4),
              Text(customer['email'], style: const TextStyle(fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList() {
    final customer = customers[selectedCustomerIndex];
    final orders = customer['orders'] as List<Map<String, dynamic>>;

    return Container(
      padding: const EdgeInsets.all(24),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildActionButton(Icons.receipt, 'Order'),
              const SizedBox(width: 12),
              _buildActionButton(Icons.edit_note, 'Note'),
              const SizedBox(width: 12),
              _buildActionButton(Icons.warning_amber, 'Issue'),
              const SizedBox(width: 12),
              _buildActionButton(Icons.view_in_ar, 'Open AR'),
            ],
          ),
          const SizedBox(height: 24),
          if (orders.isEmpty)
            const Padding(
              padding: EdgeInsets.all(32.0),
              child: Center(
                child: Text(
                  'No orders available',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            )
          else
            ...orders.map((order) => _buildOrderRow(order)).toList(),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        side: const BorderSide(color: Color(0xFFE0E0E0)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildOrderRow(Map<String, dynamic> order) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(order['date'], style: const TextStyle(fontSize: 14)),
          ),
          SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(order['quantity'], style: const TextStyle(fontSize: 14)),
                Text(order['amount'],
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          SizedBox(
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Order NO:',
                    style: TextStyle(fontSize: 13, color: Colors.grey)),
                Text(order['orderNo'], style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
          SizedBox(
            width: 80,
            child: Text(order['status'], style: const TextStyle(fontSize: 14)),
          ),
          Expanded(
            child: Text(order['type'], style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
