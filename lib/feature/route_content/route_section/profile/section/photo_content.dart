import 'package:flutter/material.dart';

class AlbumCategory {
  final String name;
  final IconData icon;
  final Color iconColor;
  final int photoCount;
  final bool isNew;
  final List<String> images;

  AlbumCategory({
    required this.name,
    required this.icon,
    required this.iconColor,
    required this.photoCount,
    this.isNew = false,
    required this.images,
  });
}

class Photo extends StatefulWidget {
  const Photo({Key? key}) : super(key: key);

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  final List<AlbumCategory> albums = [
    AlbumCategory(
      name: 'Cooler ',
      icon: Icons.home,
      iconColor: const Color(0xFF00BCD4),
      photoCount: 4,
      isNew: true,
      images: List.generate(4, (index) => 'cooler'),
    ),
    AlbumCategory(
      name: 'Customer',
      icon: Icons.photo_camera,
      iconColor: const Color(0xFFFF9800),
      photoCount: 6,
      isNew: true,
      images: List.generate(4, (index) => 'customer'),
    ),
    AlbumCategory(
      name: 'Market Survey',
      icon: Icons.shopping_bag,
      iconColor: const Color(0xFF4CAF50),
      photoCount: 4,
      isNew: false,
      images: List.generate(4, (index) => 'market'),
    ),
    AlbumCategory(
      name: 'Favorite',
      icon: Icons.favorite,
      iconColor: const Color(0xFFE91E63),
      photoCount: 4,
      isNew: false,
      images: List.generate(4, (index) => 'favorite'),
    ),
  ];

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 22,
          ),
          Text(
            'Album',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Expanded(
            // <-- Add this
            child: Row(
              children: [
                _buildAlbumSidebar(),
                Expanded(child: _buildPhotoGrid()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlbumSidebar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(top: 20),
      margin: EdgeInsets.only(top: 25),
      width: 250,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          final isSelected = selectedCategoryIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFFF5F5F5) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: album.iconColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      album.icon,
                      color: album.iconColor,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                album.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            if (album.isNew)
                              Container(
                                margin: const EdgeInsets.only(left: 4),
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${album.photoCount} Pics',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPhotoGrid() {
    final selectedAlbum = albums[selectedCategoryIndex];

    return Container(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 22),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.3,
        ),
        itemCount: selectedAlbum.images.length,
        itemBuilder: (context, index) {
          return _buildPhotoCard(selectedAlbum.images[index], index);
        },
      ),
    );
  }

  Widget _buildPhotoCard(String imageType, int index) {
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildPlaceholderImage(imageType),
            // Overlay gradient for better text visibility
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),
            // Action buttons
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                children: [
                  _buildIconButton(Icons.edit, Colors.white),
                  const SizedBox(width: 4),
                  _buildIconButton(Icons.delete_outline, Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage(String type) {
    Color backgroundColor;
    IconData icon;

    switch (type) {
      case 'cooler':
        backgroundColor = Colors.blue[100]!;
        icon = Icons.kitchen;
        break;
      case 'customer':
        backgroundColor = Colors.orange[100]!;
        icon = Icons.store;
        break;
      case 'market':
        backgroundColor = Colors.pink[50]!;
        icon = Icons.shopping_cart;
        break;
      case 'favorite':
        backgroundColor = Colors.brown[100]!;
        icon = Icons.business;
        break;
      default:
        backgroundColor = Colors.grey[200]!;
        icon = Icons.image;
    }

    return Container(
      color: backgroundColor,
      child: Center(
        child: Icon(
          icon,
          size: 48,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Color color) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        icon,
        color: color,
        size: 18,
      ),
    );
  }
}
