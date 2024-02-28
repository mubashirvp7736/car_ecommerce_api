
import 'package:ecommerce/controller/product_provider.dart';
import 'package:ecommerce/controller/search_provider.dart';
import 'package:ecommerce/model/wishlist_model.dart';
import 'package:ecommerce/view/pages/product_details.dart';
import 'package:ecommerce/widgets/home_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    Provider.of<ProductProvider>(context, listen: false).getData();
    Size mediaQuery = MediaQuery.of(context).size;
        Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: searchProvider.searchController,
                      onChanged: (value) => searchProvider.search(searchProvider.searchController.text, context),
                      decoration: InputDecoration(suffixIcon: Icon(Icons.search)),
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                   
                    },
                    child: Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(child: Text("HOME", style: GoogleFonts.abel(fontSize: 30, fontWeight: FontWeight.w700),)),
              SizedBox(height: 10),
              Expanded(
                child: Consumer2<SearchProvider, ProductProvider>(
                  builder: (context, searchValue, productValue, child) {
                    if (searchValue.searchedList.isEmpty &&
                        searchProvider.searchController.text.isNotEmpty) {
                      return Center(child: Lottie.asset('assets/login_screen.json'));
                    } else if (searchValue.searchedList.isEmpty) {
                      if (productValue.productList.isNotEmpty) {
                        final allProducts = productValue.productList;
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: mediaQuery.width * 0.0018,
                          ),
                          itemCount: allProducts.length,
                          itemBuilder: (context, index) {
                            final product = allProducts[index];
                            final wishProduct = WishListModel(id: product.id);
                            return LayoutBuilder(
                              builder: (BuildContext context, BoxConstraints constraints) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetailScreen(
                                          image: NetworkImage(product.image.toString()),
                                          category: product.category,
                                          description: product.description,
                                          title: product.title,
                                          price: product.price,
                                        ),
                                      ),
                                    );
                                  },
                                  child:ProductContainer(
                                 product: product,
                                 productId: wishProduct,
                                  )
                                );
                              },
                            );
                          },
                        );
                      } else {
                        return Center(child: Text('NO ITEMS ADDED', style: GoogleFonts.abel(fontSize: 20, fontWeight: FontWeight.w700)));
                      }
                    } else {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: mediaQuery.width * 0.0018,
                        ),
                        itemCount: searchValue.searchedList.length,
                        itemBuilder: (context, index) {
                          final product = searchValue.searchedList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                    image: NetworkImage(product.image.toString()),
                                    category: product.category,
                                    description: product.description,
                                    title: product.title,
                                    price: product.price,
                                  ),
                                ),
                              );
                          },
                            child: prodectShow(

                              size,
                              context,
                              title: product.title,
                              imagepath: NetworkImage(product.image.toString()),
                              prize: product.price,
                              
                           ) );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
