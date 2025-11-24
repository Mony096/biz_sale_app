import 'package:flutter/material.dart';

class Contact {
  String name;
  String position;
  String phone;
  String mobile;
  String email;

  Contact({
    required this.name,
    required this.position,
    required this.phone,
    required this.mobile,
    required this.email,
  });
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Contact> contacts = [
    Contact(
      name: 'Mr.White',
      position: 'Sales Manager',
      phone: '011 456 789',
      mobile: '010 123 123',
      email: 'Mrwhite@gmail.com',
    ),
    Contact(
      name: 'Barry Rorgen',
      position: 'Sales Report',
      phone: '011 456 789',
      mobile: '010 123 123',
      email: 'Barryro@gmail.com',
    ),
  ];

  int? editingIndex;

  void _showAddContactDialog() {
    final nameController = TextEditingController();
    final positionController = TextEditingController();
    final phoneController = TextEditingController();
    final mobileController = TextEditingController();
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Contact'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: positionController,
                decoration: const InputDecoration(
                  labelText: 'Position',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: mobileController,
                decoration: const InputDecoration(
                  labelText: 'Mobile',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                setState(() {
                  contacts.add(Contact(
                    name: nameController.text,
                    position: positionController.text,
                    phone: phoneController.text,
                    mobile: mobileController.text,
                    email: emailController.text,
                  ));
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAccountDetailCard(),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildContactsList()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountDetailCard() {
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT IMAGE + LABEL COLUMN
          Container(
            width: 180, // FIXED WIDTH
            padding: const EdgeInsets.only(right: 20),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: Color(0xFFE0E0E0), width: 1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Account Detail",
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 14),

                // IMAGE BOX
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    height: 130,
                    color: Colors.red[400],
                    child: Stack(
                      children: [
                        const Center(
                          child:
                              Icon(Icons.store, size: 48, color: Colors.white),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.red[700],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.favorite,
                                    color: Colors.white, size: 14),
                                SizedBox(width: 4),
                                Text(
                                  'Pharmacy',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 24),

          // COLUMN 1
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: Color(0xFFE0E0E0), width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionHeader("Information"),
                  _buildDetailRow('Name:', 'Customer A', 75),
                  _buildDetailRow('Email:', 'test@mail.com', 75),
                  _buildDetailRow('Tel:', '011 456 789', 75),
                  _buildDetailRow('Address:', 'Long address here...', 75),
                  _buildDetailRow('Open:', '07:00 AM - 09:00 PM', 75),
                ],
              ),
            ),
          ),

          const SizedBox(width: 24),

          // COLUMN 2
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: Color(0xFFE0E0E0), width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionHeader("Business"),
                  _buildDetailRow('Trade Channel:', 'Pharmacy', 105),
                  _buildDetailRow('Segment:', 'White', 105),
                  _buildDetailRow('Delivery Type:', 'Indirect', 105),
                  _buildDetailRow('Distributor:', 'C Rabie Distribu', 105),
                  _buildDetailRow('Next Call Day:', 'Jan 20 • Tue', 105),
                ],
              ),
            ),
          ),

          const SizedBox(width: 24),

          // COLUMN 3
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionHeader("Financial"),
                _buildDetailRow('Payment Type:', 'Cash', 115),
                _buildDetailRow('Credit Limit:', '5,000 USD', 115),
                _buildDetailRow('Available Credit:', '2,000 USD', 115),
                _buildDetailRow('Credit Days:', '30 Days', 115),
                _buildDetailRow('Open Balance:', '200 USD', 115),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, double labelWidth) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label with width set by parent
          SizedBox(
            width: labelWidth,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Value - auto wrap
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Add Contact Button
        ElevatedButton.icon(
          onPressed: _showAddContactDialog,
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Add Contact'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0A1628),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Contact Cards
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: contacts.asMap().entries.map((entry) {
            final index = entry.key;
            final contact = entry.value;
            final isEditing = editingIndex == index;

            return _buildContactCard(contact, index, isEditing);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildContactCard(Contact contact, int index, bool isEditing) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isEditing ? const Color(0xFF0A1628) : const Color(0xFFE0E0E0),
          width: isEditing ? 2 : 1,
        ),
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
          // Header with edit icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Contacts',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        editingIndex = isEditing ? null : index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.edit,
                        size: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      setState(() {
                        contacts.removeAt(index);
                        if (editingIndex == index) {
                          editingIndex = null;
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.delete_outline,
                        size: 18,
                        color: Colors.red[400],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Contact details
          _buildContactRow(Icons.person_outline, contact.name),
          _buildContactRow(Icons.work_outline, contact.position),
          _buildContactRow(Icons.phone_outlined, contact.phone),
          _buildContactRow(Icons.smartphone_outlined, contact.mobile),
          _buildContactRow(Icons.email_outlined, contact.email),

          // Action buttons for editing
          if (isEditing) ...[
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      editingIndex = null;
                    });
                  },
                  icon: const Icon(Icons.close, size: 20),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    // Save changes
                    setState(() {
                      editingIndex = null;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Contact updated')),
                    );
                  },
                  icon: const Icon(Icons.check, size: 20),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey[600]),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF3E3E40),
        ),
      ),
    );
  }
}
