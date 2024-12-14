import 'package:flutter/material.dart';
import '../widget/sidebar.dart';

 class Beranda extends StatelessWidget {
 const Beranda({super.key});
 @override
 Widget build(BuildContext context) {
 return Scaffold(
  drawer: Sidebar(),
 appBar: 
 AppBar(title: Text("Beranda"),
 titleTextStyle: TextStyle(color:Colors.white,
 fontSize: 20,
 ),
  backgroundColor: Colors.blue,),
 body: Center(
 child: Text("Selamat Datang",
 style: TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Colors.blue,
  letterSpacing: 1.2,
  shadows: [
    Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 3.0,
      color: Colors.black.withOpacity(0.3),
    )
  ],
 ),
 ),
 ),
 );
 }
 }