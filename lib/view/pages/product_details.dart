// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ecommerce/widgets/normal_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final title;
  final description;
  final category;
  final price;
  final image;
  const ProductDetailScreen(
      {super.key,
      this.title,
      this.description,
      this.category,
      this.price,
      this.image});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            Center(
              child: Card(
                elevation: 5,
                child: Container(
                  height: mediaQuery.height * 0.23,
                  width: mediaQuery.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: image, fit: BoxFit.cover),
                      color: Colors.grey[500]),
                ),
              ),
            ),
            SizedBox(height: mediaQuery.height * 0.06),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productsDetails(hint: 'Brand :', value: title),
                const SizedBox(height: 20),
                productsDetails(hint: 'Category :', value: category),
                const SizedBox(height: 20),
                productsDetails(
                    hint: 'Price : ', value: '₹ ${price.toString()}'),
                const SizedBox(height: 20),
                SizedBox(
                  height: mediaQuery.height * 0.25,
                  width: mediaQuery.width * double.infinity,
                  child: Card(
                      elevation: 5,
                      child: productDescDetails(
                          hint: 'Description :', value: description)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}