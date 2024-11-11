import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Đây là mockup dữ liệu cho sản phẩm
class Product {
  final String name;
  final String imagePath;
  final double price;

  Product({required this.name, required this.imagePath, required this.price});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Mockup danh sách sản phẩm
  List<Product> products = [
    Product(name: "Sofa", imagePath: "assets/images/img_prod1.jpg", price: 299.99),
    Product(name: "Table", imagePath: "assets/images/img_prod2.jpg", price: 200),
    Product(name: "Chair", imagePath: "assets/images/img_prod3.jpg", price: 999),
    Product(name: "Lamp", imagePath: "assets/images/img_prod4.jpg", price: 49.99),
    Product(name: "Bad", imagePath: "assets/images/img_prod5.jpg", price: 49.99),
    Product(name: "Product", imagePath: "assets/images/product1.png", price: 49.99),
    Product(name: "Product", imagePath: "assets/images/product2.png", price: 49.99),
    Product(name: "Product", imagePath: "assets/images/product3.png", price: 49.99),
    Product(name: "Product", imagePath: "assets/images/product4.png", price: 49.99),
  ];

  // Biến lưu trữ trạng thái sắp xếp
  bool isSortedAsc = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: buildBody(context),
      floatingActionButton: buildFloatingButtons(context),
    );
  }

  // Phần thân của giao diện
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        menuCustom(),
        Expanded(
          child: buildProducts(),
        ),
      ],
    );
  }

  // Hiển thị các sản phẩm trong lưới
  Widget buildProducts() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return productItem(products[index]);
        },
      ),
    );
  }

  // Mỗi sản phẩm hiển thị trong item
  Widget productItem(Product product) {
    double height = 200.0;
    return InkWell(
      onTap: () {
        // Logic cho việc nhấn vào sản phẩm có thể thêm vào sau
      },
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(product.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "\$${product.price}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // AppBar tùy chỉnh với nút sắp xếp
  AppBar AppBarCustom() {
    return AppBar(
      backgroundColor: Color(0xFFBBDEFB),// Màu nền hiện đại
      title: Text(
        "Furniture Store",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.sort,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isSortedAsc = !isSortedAsc;
              products.sort((a, b) => isSortedAsc
                  ? a.price.compareTo(b.price)
                  : b.price.compareTo(a.price));
            });
          },
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          onPressed: () {
            // Logic điều hướng giỏ hàng có thể thêm vào sau
          },
        ),
      ],
    );
  }

  // Các nút hành động nổi
  Widget buildFloatingButtons(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        FloatingActionButton(
          onPressed: () {
            // Logic cho GameVoucherPage
          },
          backgroundColor: Color(0xFFBBDEFB),  // Màu sắc nổi bật
          child: Icon(Icons.card_giftcard),
        ),
        SizedBox(height: 10),
        FloatingActionButton(
          onPressed: () {
            // Logic cho ChatBotPage
          },
          backgroundColor: Color(0xFFBBDEFB),
          child: Icon(Icons.chat),
        ),
      ],
    );
  }

  // Menu tùy chỉnh
  Widget menuCustom() {
    List<String> menuItems = ['All', 'Sofas', 'Tables', 'Chairs'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: menuItems
            .map((item) => InkWell(
          onTap: () {
            // Logic cho menu có thể thêm vào sau
          },
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 22,
                child: Icon(Icons.category, color: Color(0xFF42A5F5)),
              ),
              SizedBox(height: 8),
              Text(
                item,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ))
            .toList(),
      ),
    );
  }
}
