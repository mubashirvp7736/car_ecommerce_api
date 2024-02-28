import 'dart:developer';

import 'package:ecommerce/controller/product_provider.dart';
import 'package:ecommerce/controller/store_provider.dart';
import 'package:ecommerce/controller/wishlist_provider.dart';
import 'package:ecommerce/widgets/home_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getWishList(context);
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 22, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textAbel(data: 'WishList', size: 20, weight: FontWeight.bold),
            const SizedBox(height: 20),
            Consumer2<WishListProvider, ProductProvider>(
                builder: (context, wishList, productItem, child) {
              return Expanded(
                child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: ListView.builder(
                      itemCount: wishList.WishListItemaId.length,
                      itemBuilder: (context, index) {
                        final itemId = wishList.WishListItemaId[index];
                        final product = productItem.productList[index];
                        final id = itemId;
                        final allProductIds = productItem.productList
                            .map((product) => product.id)
                            .toList();
                        return Container(
                          height: mediaQuery.height * 0.2,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color(0xFF202020),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Container(
                                width: mediaQuery.width * .2,
                                height: mediaQuery.height * .1,
                                margin: const EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            product.image.toString()))),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    textAbel(
                                        data: product.title.toString(),
                                        size: 15,
                                        weight: FontWeight.w300),
                                    textAbel(
                                        data: product.price.toString(),
                                        size: 12,
                                        weight: FontWeight.w200)
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    deleteWishList(context, id);
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        );
                      },
                    )),
              );
            }),
          ],
        ),
      ),
    );
  }

  Future getWishList(context) async {
    final store = Provider.of<StoreProvider>(context, listen: false);
    final getPrvd = Provider.of<WishListProvider>(context, listen: false);
    final userId = await store.getValues('userId');
    final token = await store.getValues('tokenId');
    await getPrvd.getWishListProduct(userId, token);
  }

  Future deleteWishList(context, dynamic product) async {
    final store = Provider.of<StoreProvider>(context, listen: false);
    final userId = await store.getValues('userId');
    final token = await store.getValues('tokenId');
    final wishProvider = Provider.of<WishListProvider>(context, listen: false);

    if (userId != null && token != null) {
      final productId = product['_id'];
      wishProvider.deleteFromWishList(productId, userId, token);
      if (wishProvider.wishListStatuscode == '200') {
        log("Product deleted from Wishlist");
      } else if (wishProvider.wishListStatuscode == '500') {
        log('Product already in wishlist');
      }
    } else {
      log('You are not logged in');
    }
  }
}