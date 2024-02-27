import 'package:ecommerce/view/loginpages/login_screen.dart';
import 'package:flutter/material.dart';
import"package:http/http.dart"as http;
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
        Stack(
            children: [
              const Image(image: AssetImage('assets/welcome.jpg'),
              height:double.infinity ,
              width: double.infinity,
              fit: BoxFit.cover,    
              ),
            Positioned(
              top: 270,
              left: 140,
               child: const Text('MODERN CARS',
                  style:TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.0,
                    shadows: [Shadow(
                      blurRadius: 5.0,
                      color: Colors.black,
                      offset: Offset(2, 2),
                    )])),
             ),
                
                     Padding(
                      padding:const EdgeInsets.only(top: 340,left: 230),
                      child: Column(
                        children: [
                          const Text('Bring youre dream car.!',
                          style: TextStyle(fontStyle: FontStyle.italic,fontSize: 18        
                          ),
                          ),
                        const  SizedBox(height: 50,),
                          ElevatedButton(
                           style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue, 
                                  padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 12), 
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0), 
                                  ),
                                  elevation: 4, 
                                  shadowColor: Colors.grey, 
                                ),
                            onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: ((context) => LoginScreen() )));
                          }, child: const Text('GET STARTED ->'))
                        ],
                      ),
                      
                      
                  )
               
         ] ),
      );
  }
}