import 'package:flutter/material.dart';
import '../models/topping.dart';
import 'manajemen_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class KasirPage extends StatefulWidget {
  final List<Topping> daftarTopping;

  KasirPage({required this.daftarTopping});

  @override
  State<KasirPage> createState() => _KasirPageState();
}

class _KasirPageState extends State<KasirPage> {

  List<ItemKeranjang> keranjang = [];

  void tambahKeKeranjang(Topping topping) {
    if (topping.stok <= 0) return;

    setState(() {
      int index =
          keranjang.indexWhere((item) =>
              item.topping.nama == topping.nama);

      if (index != -1) {
        keranjang[index].qty++;
      } else {
        keranjang.add(
          ItemKeranjang(
            topping: topping,
            qty: 1,
          ),
        );
      }

      topping.stok--;
    });
  }

  void kurangiItem(int index) {
    setState(() {
      keranjang[index].qty--;
      keranjang[index].topping.stok++;

      if (keranjang[index].qty <= 0) {
        keranjang.removeAt(index);
      }
    });
  }

  int getTotal() {
    int total = 0;
    for (var item in keranjang) {
      total += item.topping.harga * item.qty;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "SEBLUCKIN",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            ),
          ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings, 
              color: Colors.white,),
              onPressed: () async {
              await Get.to(
                () => ManajemenPage(
                  daftarTopping: widget.daftarTopping,
                ),
              );

setState(() {});
            },
          )
        ],
      ),
      body: Column(
        children: [

          // GRID TOPPING
          Expanded(
            flex: 2,
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              itemCount:
                  widget.daftarTopping.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemBuilder: (context, index) {
                final topping =
                    widget.daftarTopping[index];

                return Card(
                  child: InkWell(
                    onTap: () =>
                        tambahKeKeranjang(topping),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [

                        Text(
                          topping.nama,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900
                        ),),
                        Text(
                            "Rp. ${topping.harga}"),
                        Text(
                            "Stok: ${topping.stok}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Divider(),

          // KERANJANG
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: keranjang.length,
              itemBuilder: (context, index) {
                final item =
                    keranjang[index];

                return ListTile(
                  title: Text(
                      "${item.topping.nama} x${item.qty}"),
                  subtitle: Text(
                      "Rp ${item.topping.harga * item.qty}"),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle,
                        color: Colors.red),
                    onPressed: () =>
                        kurangiItem(index),
                  ),
                );
              },
            ),
          ),

          // TOTAL
          Container(
            padding: EdgeInsets.all(16),
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: Rp. ${getTotal()}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      keranjang.clear();
                    });
                  },
                  child: Text(
                    "Bayar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}