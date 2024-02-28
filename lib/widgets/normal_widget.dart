import 'package:ecommerce/controller/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void clearControllers(UserProvider controller) {
  controller.usernameController.clear();
  controller.emailController.clear();
  controller.passwordController.clear();
}

Widget productDescDetails({String? hint, String? value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        hint!,
        style: GoogleFonts.abel(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      Text(
        value!,
        style: GoogleFonts.abel(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.yellow,
            letterSpacing: 1),
      ),
    ],
  );
}

Widget productsDetails({String? hint, String? value}) {
  return Row(
    children: [
      Text(
        hint!,
        style: GoogleFonts.abel(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      Text(
        value!,
        style: GoogleFonts.abel(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.yellow,
            letterSpacing: 1),
      ),
    ],
  );
  
}
void showSuccessSnackbar(BuildContext context, String message) {
  final snackbar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 3),
    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

void showErrorSnackbar(BuildContext context, String message) {
  final snackbar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
