import 'package:flutter/material.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  int selectedCustomerIndex = 0;
  String _filter = 'all';
  Offset _mapOffset = const Offset(200, 200);
  double _scale = 1.0;
  int? _selectedMapCustomer;

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
      'visited': false,
      'mapPosition': const Offset(300, 150),
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
      'visited': true,
      'mapPosition': const Offset(180, 280),
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
      'visited': false,
      'mapPosition': const Offset(220, 320),
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
      'visited': true,
      'mapPosition': const Offset(200, 380),
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
      'visited': false,
      'mapPosition': const Offset(300, 390),
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
      'visited': true,
      'mapPosition': const Offset(360, 370),
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
      'visited': false,
      'mapPosition': const Offset(400, 330),
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
      'visited': true,
      'mapPosition': const Offset(360, 450),
    },
  ];

  final List<Offset> _territoryPoints = [
    const Offset(300, 200),
    const Offset(420, 300),
    const Offset(400, 450),
    const Offset(280, 480),
    const Offset(160, 420),
    const Offset(140, 300),
    const Offset(180, 220),
  ];

  List<Map<String, dynamic>> get _filteredCustomers {
    if (_filter == 'visited') {
      return customers.where((c) => c['visited'] == true).toList();
    } else if (_filter == 'unvisited') {
      return customers.where((c) => c['visited'] == false).toList();
    }
    return customers;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCustomerList(),
        Expanded(child: _buildMapView()),
      ],
    );
  }

  Widget _buildCustomerList() {
    return Container(
      width: 320,
      margin: const EdgeInsets.only(left: 20, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: const Border(right: BorderSide(color: Color(0xFFE0E0E0))),
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
                      _selectedMapCustomer = index;
                      // Center map on selected customer
                      final screenCenter = const Offset(400, 300);
                      _mapOffset =
                          screenCenter - customer['mapPosition'] * _scale;
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
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '0${index + 1}  ${customer['name']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                              ),
                            ),
                            Icon(
                              customer['visited']
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              size: 18,
                              color: customer['visited']
                                  ? Colors.green
                                  : (isSelected ? Colors.white54 : Colors.grey),
                            ),
                          ],
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

  Widget _buildMapView() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Map canvas
            GestureDetector(
              onScaleStart: (details) {},
              onScaleUpdate: (details) {
                setState(() {
                  _scale = (_scale * details.scale).clamp(0.5, 3.0);
                  _mapOffset += details.focalPointDelta;
                });
              },
              onTapUp: (details) {
                if (_selectedMapCustomer != null) {
                  setState(() {
                    _selectedMapCustomer = null;
                  });
                }
              },
              child: Container(
                color: Colors.grey[200],
                child: CustomPaint(
                  size: Size.infinite,
                  painter: MapPainter(
                    territoryPoints: _territoryPoints,
                    offset: _mapOffset,
                    scale: _scale,
                  ),
                ),
              ),
            ),

            // Customer markers
            ..._filteredCustomers.asMap().entries.map((entry) {
              final index = customers.indexOf(entry.value);
              final customer = entry.value;
              final position = customer['mapPosition'] * _scale + _mapOffset;

              return Positioned(
                left: position.dx - 20,
                top: position.dy - 20,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedMapCustomer = index;
                      selectedCustomerIndex = index;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: customer['visited'] ? Colors.green : Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selectedMapCustomer == index
                            ? Colors.orange
                            : Colors.white,
                        width: _selectedMapCustomer == index ? 3 : 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),

            // Customer info popup
            if (_selectedMapCustomer != null)
              Positioned(
                left: (customers[_selectedMapCustomer!]['mapPosition'].dx *
                            _scale +
                        _mapOffset.dx) -
                    125,
                top: (customers[_selectedMapCustomer!]['mapPosition'].dy *
                            _scale +
                        _mapOffset.dy) -
                    180,
                child: CustomerInfoPopup(
                  customer: customers[_selectedMapCustomer!],
                ),
              ),

            // Filter buttons (top right)
            Positioned(
              top: 16,
              right: 16,
              child: Column(
                children: [
                  FilterButton(
                    icon: Icons.location_off,
                    label: 'Unvisited',
                    isSelected: _filter == 'unvisited',
                    onTap: () {
                      setState(() {
                        _filter = _filter == 'unvisited' ? 'all' : 'unvisited';
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  FilterButton(
                    icon: Icons.location_on,
                    label: 'Visited',
                    isSelected: _filter == 'visited',
                    onTap: () {
                      setState(() {
                        _filter = _filter == 'visited' ? 'all' : 'visited';
                      });
                    },
                  ),
                ],
              ),
            ),

            // Zoom controls
            Positioned(
              top: 16,
              right: 140,
              child: Column(
                children: [
                  FloatingActionButton.small(
                    heroTag: 'zoom_in',
                    onPressed: () {
                      setState(() {
                        _scale = (_scale + 0.2).clamp(0.5, 3.0);
                      });
                    },
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.add, color: Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  FloatingActionButton.small(
                    heroTag: 'zoom_out',
                    onPressed: () {
                      setState(() {
                        _scale = (_scale - 0.2).clamp(0.5, 3.0);
                      });
                    },
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.remove, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MapPainter extends CustomPainter {
  final List<Offset> territoryPoints;
  final Offset offset;
  final double scale;

  MapPainter({
    required this.territoryPoints,
    required this.offset,
    required this.scale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw territory boundary
    final boundaryPaint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    for (int i = 0; i < territoryPoints.length; i++) {
      final point = territoryPoints[i] * scale + offset;
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    path.close();

    _drawDashedPath(canvas, path, boundaryPaint, dashWidth: 10, dashSpace: 5);

    final fillPaint = Paint()
      ..color = Colors.blue.withOpacity(0.1)
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint,
      {required double dashWidth, required double dashSpace}) {
    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      double distance = 0;
      while (distance < metric.length) {
        final segment = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(segment, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant MapPainter oldDelegate) {
    return oldDelegate.offset != offset || oldDelegate.scale != scale;
  }
}

class CustomerInfoPopup extends StatelessWidget {
  final Map<String, dynamic> customer;

  const CustomerInfoPopup({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            customer['businessName'],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            customer['name'],
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          const Divider(height: 16),
          _InfoRow(
              icon: Icons.business, text: 'Segment: ${customer['segment']}'),
          _InfoRow(icon: Icons.location_on, text: customer['address']),
          _InfoRow(icon: Icons.person, text: customer['manager']),
          _InfoRow(icon: Icons.work, text: customer['position']),
          _InfoRow(icon: Icons.phone, text: customer['managerPhone']),
          _InfoRow(icon: Icons.email, text: customer['email']),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 13, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0A1628) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black87,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
