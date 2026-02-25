import 'package:flutter/material.dart';
import 'models/topping.dart';
import 'pages/kasir_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final List<Topping> daftarTopping = [
    Topping(nama: "Kerupuk", harga: 1000, stok: 10),
    Topping(nama: "Mie Kuning", harga: 2000, stok: 15),
    Topping(nama: "Batagor Kering", harga: 1000, stok: 9),
    Topping(nama: "Dumping Keju", harga: 3000, stok: 6),
    Topping(nama: "Sosis Ayam", harga: 3000, stok: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),),
      debugShowCheckedModeBanner: false,
      home: KasirPage(
        daftarTopping: daftarTopping,
      ),
    );
  }
}