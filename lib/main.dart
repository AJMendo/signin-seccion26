import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'services/google_signin_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('AuthApp - Google - Apple'),
          actions: [
            IconButton(
              icon: const Icon( FontAwesomeIcons.doorOpen ),
              onPressed: (){
                GoogleSigInService.signOut();
              },
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                MaterialButton(
                  splashColor: Colors.transparent,
                  minWidth: double.infinity,
                  height: 40,
                  color: Colors.red,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon( FontAwesomeIcons.google, color: Colors.white, ),
                      Text('  Sign in with Google', style: TextStyle( color: Colors.white, fontSize: 17 )),
                    ],
                  ),
                  onPressed: (){
                    GoogleSigInService.signInWithGoogle();
                  },
                ),

              ],
            ),
          ),
        )
      ),
    );
  }
}