import 'package:flutter/material.dart';
import '../models/topping.dart';

class ManajemenPage extends StatefulWidget {
  final List<Topping> daftarTopping;

  ManajemenPage({required this.daftarTopping});

  @override
  State<ManajemenPage> createState() =>
      _ManajemenPageState();
}

class _ManajemenPageState extends State<ManajemenPage> {
  TextEditingController namaController =
      TextEditingController();
  TextEditingController hargaController =
      TextEditingController();
  TextEditingController stokController =
      TextEditingController();

  int? indexEdit;

  void simpanData() {
    String nama = namaController.text;
    int harga = int.tryParse(hargaController.text) ?? 0;
    int stok = int.tryParse(stokController.text) ?? 0;

    if (nama.isEmpty) return;

    setState(() {
      if (indexEdit == null) {
        // CREATE
        widget.daftarTopping.add(
          Topping(
            nama: nama,
            harga: harga,
            stok: stok,
          ),
        );
      } else {
        // UPDATE
        widget.daftarTopping[indexEdit!] =
            Topping(
          nama: nama,
          harga: harga,
          stok: stok,
        );
        indexEdit = null;
      }
    });

    namaController.clear();
    hargaController.clear();
    stokController.clear();
  }

  void editData(int index) {
    final topping = widget.daftarTopping[index];

    namaController.text = topping.nama;
    hargaController.text = topping.harga.toString();
    stokController.text = topping.stok.toString();

    setState(() {
      indexEdit = index;
    });
  }

  void hapusData(int index) {
    setState(() {
      widget.daftarTopping.removeAt(index);
    });
  }

  void batalEdit() {
    setState(() {
      indexEdit = null;
    });

    namaController.clear();
    hargaController.clear();
    stokController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Manajemen Topping",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔥 Indicator jika sedang edit
            if (indexEdit != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Perbarui Data",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

            TextField(
              controller: namaController,
              decoration:
                  InputDecoration(labelText: "Nama Topping"),
            ),

            TextField(
              controller: hargaController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Harga"),
            ),

            TextField(
              controller: stokController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Stok"),
            ),

            SizedBox(height: 12),

            Row(
              children: [

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: simpanData,
                    child: Text(
                      indexEdit == null
                          ? "Tambah Topping"
                          : "Perbarui Topping",
                      style: TextStyle(
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                if (indexEdit != null) ...[
                  SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black, // warna teks
                          side: BorderSide(
                            color: Colors.black, // warna border
                            width: 1.5,
                          ),
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                  8),
                        ),
                        padding:
                            EdgeInsets.symmetric(
                                vertical: 14),
                      ),
                      onPressed: batalEdit,
                      child: Text(
                        "Batal",
                        style: TextStyle(
                            fontWeight:
                                FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ],
            ),

            Divider(height: 30),

            Expanded(
              child: ListView.builder(
                itemCount:
                    widget.daftarTopping.length,
                itemBuilder: (context, index) {
                  final topping =
                      widget.daftarTopping[index];

                  return Card(
                    child: ListTile(
                      title: Text(topping.nama),
                      subtitle: Text(
                          "Rp. ${topping.harga} | Stok: ${topping.stok}"),
                      trailing: Row(
                        mainAxisSize:
                            MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                                Icons.edit,
                                color:
                                    Colors.red),
                            onPressed: () =>
                                editData(index),
                          ),
                          IconButton(
                            icon: Icon(
                                Icons.delete,
                                color:
                                    Colors.red),
                            onPressed: () =>
                                hapusData(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}