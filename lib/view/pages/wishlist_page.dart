import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mock wishlist items (replace this with actual data)
    List<Map<String, dynamic>> wishlistItems = [
      {
        'name': 'Product 1',
        'price': 20.0,
        'image': 'assets/images/product1.jpg'
      },
      {
        'name': 'Product 2',
        'price': 30.0,
        'image': 'assets/images/product2.jpg'
      },
      // Add more items as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          final item = wishlistItems[index];
          return Slidable(
            startActionPane: ActionPane(motion: ScrollMotion(), children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              )
            ]),
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,
                  onPressed: (context) {},
                  backgroundColor: Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.archive,
                  label: 'Archive',
                ),
                SlidableAction(
                  onPressed: (context) {},
                  backgroundColor: Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  icon: Icons.save,
                  label: 'Save',
                ),
              ],
            ),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(item['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(item['name']),
              subtitle: Text('Price: \$${item['price']}'),
              // Implement remove item from wishlist functionality if needed
              // onTap: () {
              //   // Remove item from wishlist
              // },
            ),
          );
        },
      ),
    );
  }
}
