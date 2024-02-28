// // ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';
import 'package:ecommerce/controller/store_provider.dart';
import 'package:ecommerce/controller/wishlist_provider.dart';
import 'package:ecommerce/widgets/normal_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductContainer extends StatelessWidget {
  final product;
  final productId;

  const ProductContainer({Key? key, this.product, this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: mediaQuery.size.width * 0.3,
              width: mediaQuery.size.width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(
                    product.image.toString(),
                  ),
                ),
              ),
            ),
          ),
          Text(
            product.title ?? 'Unknown',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            product.category ?? 'Unknown',
            style: TextStyle(
              color: product.category == 'men' ? Colors.blue : Colors.pink,
              fontSize: 12,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹ ${product.price.toString()}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              IconButton(
                onPressed: () async {
                  toWishList(context, productId);
                },
                icon: const Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
//   // Future toWishList(context, product) async {
//   //   final store = Provider.of<StoreProvider>(context, listen: false);
//   //   final userId = await store.getValues('userId');
//   //   final token = await store.getValues('tokenId');
//   //   final wishProvider = Provider.of<WishListProvider>(context, listen: false);

//   //   if (userId != null && token != null) {
//   //     wishProvider.addToWishList(product, userId, token);
//   //     if (wishProvider.wishListStatuscode == '200') {
//   //       log("Product added to Wishlist");
//   //     } else if (wishProvider.wishListStatuscode == '500') {
//   //       log('Product already in wishlist');
//   //     }
//   //   } else {
//   //     log('Your are not loged in ');
//   //   }
//   // }

//   Future toWishList(context, productId) async {
//     final store = Provider.of<StoreProvider>(context, listen: false);
//     final userId = await store.getValues('userId');
//     final token = await store.getValues('tokenId');
//     final wishProvider = Provider.of<WishListProvider>(context, listen: false);

//     if (userId != null && token != null) {
//       wishProvider.addToWishList(productId.id, userId,
//           token); // Pass product Id.id instead of productId
//       if (wishProvider.wishListStatuscode == '200') {
//         log("Product added to Wishlist");
//       } else if (wishProvider.wishListStatuscode == '500') {
//         log('Product already in wishlist');
//       }
//     } else {
//       log('You are not logged in');
//     }
//   }
// }
Widget prodectShow(Size size, context,
    {product, required title, required imagepath, required prize}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(192, 255, 255, 255)),
              child: IconButton(
                icon: const Icon(
                Icons.favorite,
                ),
                onPressed: () async {
                  toWishList(
                      context,
                      product
                          .id); // Pass product.id instead of the entire product
                },
              ),
            ),
          ),
          height: size.width * .40,
          width: size.width * .35,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(image: imagepath, fit: BoxFit.cover),
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        const SizedBox(height: 10),
        //SizedBox(
       //   width: size.width * .35,
        //   child: ReadMoreText(
        //       style: TextStyle(
        //           fontSize: size.width * .035, fontWeight: FontWeight.w600),
        //       trimLines: 1,
        //       trimMode: TrimMode.Line,
        //       moreStyle: TextStyle(fontSize: size.width * .02),
        //       lessStyle: TextStyle(fontSize: size.width * .02),
        //       trimCollapsedText: "Show more",
        //       trimExpandedText: "Show less",
        //       title),
        // ),
        const SizedBox(height: 5),
        Text(
          '$prize',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Future toWishList(context, product) async {
  final store = Provider.of<StoreProvider>(context, listen: false);
  final userId = await store.getValues('userId');
  final token = await store.getValues('tokenId');
  final wishProvider = Provider.of<WishListProvider>(context, listen: false);

  if (userId != null && token != null) {
    wishProvider.addToWishList(product, userId, token);
    if (wishProvider.wishListStatuscode == '200') {
      showSuccessSnackbar(context, "Product added to Wishlist");
    } else if (wishProvider.wishListStatuscode == '500') {
      showErrorSnackbar(context, 'Product already in wishlist');
    }
  } else {
    showErrorSnackbar(context, 'Your are not loged in ');
  }
}