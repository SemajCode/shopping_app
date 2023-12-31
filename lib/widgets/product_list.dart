import 'package:flutter/material.dart';
import 'package:shop_app/widgets/product_card.dart';
import 'package:shop_app/pages/product_details.dart';
import '../global_variable.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(width: 8),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (BuildContext context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      side: const BorderSide(
                        color: Color.fromRGBO(237, 242, 247, 1),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      label: Text(filter),
                      labelStyle: const TextStyle(fontSize: 15),
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                var color = const Color.fromRGBO(245, 247, 249, 1);
                if (index.isEven) {
                  color = const Color.fromRGBO(216, 240, 253, 1);
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(product: product),
                      ),
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                    backgroundColor: color,
                  ),
                );
              },
            ),
            // : ListView.builder(
            //     itemCount: products.length,
            //     itemBuilder: (context, index) {
            //       final product = products[index];
            //       var color = const Color.fromRGBO(245, 247, 249, 1);
            //       if (index.isEven) {
            //         color = const Color.fromRGBO(216, 240, 253, 1);
            //       }
            //       return GestureDetector(
            //         onTap: () {
            //           Navigator.of(context).push(
            //             MaterialPageRoute(
            //               builder: (context) =>
            //                   ProductDetails(product: product),
            //             ),
            //           );
            //         },
            //         child: ProductCard(
            //           title: product['title'] as String,
            //           price: product['price'] as double,
            //           image: product['imageUrl'] as String,
            //           backgroundColor: color,
            //         ),
            //       );
            //     },
            //   ),
          )
        ],
      ),
    );
  }
}
