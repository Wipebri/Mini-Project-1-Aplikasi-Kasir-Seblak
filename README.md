# Mini-Project-1-Aplikasi-Kasir-Seblak
| DWI PEBRIYANTO PRADANA | 2409116012 | SISTEM INFORMASI A 2024 |

# SEBLUCKIN
SEBLUCKIN adalah aplikasi kasir sederhana yang dirancang untuk membantu pengusaha seblak, dalam mengelola transaksi penjualan dan manajemen topping secara efisien. Aplikasi ini memungkinkan membantu pengusaha seblak untuk Menampilkan daftar topping, Menambahkan topping ke dalam keranjang dengan sistem pengurangan stok otomatis, Mengelola topping, Menghitung total pembayaran secara otomatis. Dengan tampilan yang sederhana, responsif, dan mudah digunakan, SEBLUCKIN membantu mempercepat proses transaksi serta meminimalisir kesalahan pencatatan stok dan perhitungan total harga. Aplikasi ini dikembangkan menggunakan Flutter dengan pendekatan stateful management dan struktur modular untuk menjaga keterbacaan serta maintainability kode.

## Fitur Aplikasi

### 1. Kasir
<img width="380" height="570" alt="image" src="https://github.com/user-attachments/assets/ee379a8f-2754-4ee2-b77d-b063a135784a" />

Aplikasi ini memiliki fitur utama berupa tampilan daftar topping interaktif yang memudahkan kasir dalam memilih menu dengan cepat. Setiap topping menampilkan informasi nama, harga, dan stok yang tersedia, sehingga pengguna dapat langsung mengetahui ketersediaan bahan secara real-time. Pengguna dapat menambahkan, menghapus, atau memperbarui topping dengan masuk ke menu manajemen topping, yaitu dengan menekan tombol gergi di pojk kanan atas.

<img width="380" height="570" alt="image" src="https://github.com/user-attachments/assets/6ec7dbc2-f1cb-470e-944e-13a7707a69b8" />

Aplikasi ini juga memiliki sistem keranjang belanja yang secara otomatis menampung topping yang dipilih. Ketika sebuah topping ditekan, item tersebut akan masuk ke dalam keranjang dan stok akan berkurang secara otomatis. Pengguna juga dapat mengurangi jumlah topping atau menghapusnya dari keranjang dengan menekan tombol "-" pada toping yang ingin dikurangi dari keranjang, dan sistem akan menyesuaikan kembali jumlah stok yang tersedia. Total harga transaksi dihitung secara otomatis berdasarkan jumlah dan harga masing-masing topping, sehingga meminimalkan kesalahan perhitungan manual.

<img width="380" height="570" alt="image" src="https://github.com/user-attachments/assets/fa07cd97-a7c7-4368-bc7a-d25a02a43f98" />

Ketika menekan tombol bayar maka topping dikeranjang akan hilang yang mengartikan transaksi sudah dilakukan dan stok sesuai saat dilakukan pembayaran.

### 2. Manajemen Toppoing
<img width="380" height="570" alt="image" src="https://github.com/user-attachments/assets/9e0d2b7a-5d23-4659-846c-8c0d556eb243" />

Aplikasi ini juga menyediakan fitur manajemen topping yang memungkinkan pengguna untuk menambahkan, mengubah, dan menghapus data topping. Fitur ini memberikan fleksibilitas kepada pemilik usaha dalam mengatur harga, memperbarui stok, maupun menyesuaikan menu sesuai kebutuhan.

#### Menambahkan Topping
<img width="380" height="570" alt="image" src="https://github.com/user-attachments/assets/f9535cec-5c9a-4901-b608-af7d1aa637fe" />

Menambahkan topping dapat dilakukan dengan mengisi kolom nama topping, harga, dan stok. setelah itu pengguna tinggal menekan tambah topping maka toping akan ditambahkan ke dalam aplikasi.

#### Menghapus Topping
<img width="380" height="570" alt="image" src="https://github.com/user-attachments/assets/4abd0afe-6af3-45c0-b4ee-5d4e2d786f63" />

Menghapus topping dapat dilakukan dengan menekan icon keranjang sampah pada topping yang ingin di hapus, setelah ditekan topping otomatis aka hilang.

#### Memperbarui Topping
<img width="380" height="570" alt="image" src="https://github.com/user-attachments/assets/971db30f-f2d4-4ee5-bbde-5f1d8a2c9328" />

Memperbarui toping dapat dilakukan dengan menekan icon pensil pada toping yang ingin di ubah, akan muncul tulisan perbarui data dan kolom nama topping, harga, dan stok akan terisi otomatos dengan topping yang ingin di ubah. pengguna bisa langsung memngubah sesuai dengan yang ia inginkan. jika ingin menyimpan perubahan maka tinggal menekan perbarui topping, jika tidak maka tekan batal.
