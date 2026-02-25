class Topping {
  String nama;
  int harga;
  int stok;

  Topping({
    required this.nama,
    required this.harga,
    required this.stok,
  });
}

class ItemKeranjang {
  Topping topping;
  int qty;

  ItemKeranjang({
    required this.topping,
    required this.qty,
  });
}