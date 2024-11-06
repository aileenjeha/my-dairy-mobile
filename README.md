## Tugas 8

#### Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
const digunakan untuk mendefinisikan objek yang tidak akan berubah saat aplikasi berjalan. Keuntungan utama menggunakan const adalah efisiensi memori dan performa aplikasi karena widget yang bersifat konstan dapat didaur ulang. Kita sebaiknya menggunakan const pada widget atau nilai yang sifatnya tetap, misalnya teks atau ikon yang tidak akan berubah selama siklus hidup aplikasi. Namun, const tidak digunakan pada elemen yang memiliki perubahan nilai atau data yang dinamis.

#### Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
Column dan Row adalah widget layout yang berguna untuk menyusun elemen secara vertikal (Column) dan horizontal (Row). Misalnya, pada aplikasi form, Column sering digunakan untuk menata form input agar vertikal. Sedangkan Row cocok untuk menyusun elemen seperti ikon atau teks secara horizontal. Contoh implementasi Column: Column(children: [Text("Nama"), TextField()]); sedangkan contoh Row: Row(children: [Icon(Icons.star), Text("Rating")]).

#### Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Pada halaman form tugas ini, elemen input yang digunakan meliputi TextFormField untuk memasukkan nama, deskripsi, kandungan lemak, harga, jumlah, dan rating produk. Elemen input lain di Flutter seperti DropdownButton, Slider, atau Checkbox tidak digunakan karena tidak relevan dengan data input yang dibutuhkan. Elemen-elemen tersebut lebih cocok untuk pilihan yang bersifat tetap atau opsi biner.

#### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Tema diatur dengan mengatur ThemeData pada kelas utama MyApp di Flutter, sehingga gaya warna utama dan sekunder konsisten di seluruh aplikasi. Tema dapat mencakup warna utama, sekunder, font, dan gaya tombol, memastikan tampilan yang seragam. Pada aplikasi ini, tema sudah diterapkan melalui primaryColor dan colorScheme, memungkinkan penggunaan warna seragam di seluruh aplikasi.

#### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Navigasi dalam aplikasi Flutter dengan banyak halaman biasanya dilakukan dengan menggunakan Navigator. Pada aplikasi ini, navigasi diterapkan dengan Navigator.push untuk berpindah halaman seperti menuju halaman form tambah produk. Untuk kembali atau menghapus halaman dari stack, bisa menggunakan Navigator.pop, atau Navigator.pushReplacement untuk mengganti halaman sebelumnya.

## Tugas 7

#### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
Stateless widget adalah widget yang tidak memiliki perubahan status atau kondisi selama aplikasi berjalan. Widget ini hanya menampilkan UI statis, artinya tampilannya tidak berubah ketika ada interaksi pengguna atau perubahan data. Stateful widget adalah widget yang dapat mengalami perubahan status atau kondisi, sehingga tampilannya bisa berubah ketika ada perubahan dalam data atau interaksi pengguna. Perbedaan utama antara keduanya adalah stateless widget bersifat statis dan tidak bisa berubah setelah dibuat, sementara stateful widget bisa berubah-ubah tampilannya sesuai dengan statusnya.

#### Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
- MaterialApp: Menyediakan struktur dasar untuk aplikasi Flutter, termasuk pengaturan tema, title, dan widget awal yang akan ditampilkan, yaitu MyHomePage.
- Scaffold: Menyediakan struktur dasar dari halaman, seperti AppBar, body, dan lainnya, sehingga tampilan memiliki kerangka yang konsisten di seluruh aplikasi.
- AppBar: Menyediakan bilah aplikasi di bagian atas layar yang menampilkan judul dan dapat dikustomisasi untuk menampilkan tindakan atau ikon navigasi.
- Padding: Memberikan ruang di sekitar elemen anak, berguna untuk menata tata letak dan memberikan jarak antar widget.
- Column: Menyusun widget anak secara vertikal, memudahkan penataan komponen secara berbaris dari atas ke bawah.
- Row: Menyusun widget anak secara horizontal, digunakan di sini untuk menampilkan informasi seperti NPM, Nama, dan Kelas dalam satu baris.
- Text: Menampilkan teks di layar, digunakan dalam AppBar, InfoCard, dan ItemCard untuk memberikan informasi dan judul.
- SizedBox: Menyediakan jarak atau ukuran spesifik di antara widget lainnya, misalnya untuk memberikan jarak antar elemen Column.
- GridView.count: Membuat grid view dengan jumlah kolom tetap, yang menampilkan item dalam bentuk grid dengan jumlah kolom yang sudah ditentukan.
- Card: Menyediakan wadah dengan efek bayangan yang lembut, digunakan dalam InfoCard untuk menampilkan informasi yang dibingkai dalam kotak.
- Container: Wadah umum untuk menambahkan padding, margin, dekorasi, dan batas ukuran pada widget anak.
- MediaQuery: Mengambil ukuran layar saat ini, digunakan untuk mengatur lebar elemen dalam InfoCard agar responsif terhadap ukuran layar.
- Material: Memberikan efek material pada elemen yang dapat disentuh, digunakan dalam ItemCard untuk memberikan latar belakang berwarna dan bentuk sudut membulat.
- InkWell: Memberikan respons animasi saat disentuh (ripple effect) pada ItemCard, membuat interaksi pengguna lebih jelas dan natural.
- SnackBar: Menampilkan pesan singkat di bagian bawah layar ketika pengguna menekan tombol pada ItemCard, sebagai feedback visual atas aksi pengguna.

#### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() adalah fungsi dalam stateful widget yang digunakan untuk memberi tahu Flutter bahwa ada perubahan status pada widget tersebut dan UI perlu diperbarui. Dengan memanggil setState(), semua variabel yang didefinisikan dalam state widget tersebut bisa terdampak, sehingga tampilannya dapat berubah mengikuti nilai variabel yang baru. Misalnya, jika ada variabel counter yang menampung nilai penghitung, memanggil setState() setelah mengubah counter akan memperbarui tampilan penghitung di layar.

#### Jelaskan perbedaan antara const dengan final.
Perbedaan antara const dan final adalah bahwa const menunjukkan nilai yang konstan pada waktu kompilasi dan tidak akan berubah sama sekali selama aplikasi berjalan. Sementara itu, final menetapkan nilai yang juga tidak bisa diubah setelah diinisialisasi, tetapi nilainya bisa ditentukan pada waktu runtime. Const lebih ketat daripada final karena hanya digunakan untuk nilai yang benar-benar konstan dan diketahui pada waktu kompilasi, sedangkan final bisa digunakan untuk nilai yang ditentukan saat aplikasi berjalan.

#### Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist.

1. Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
    - Pertama, saya membuka Terminal dan membuat direktori tempat saya akan menyimpan proyek Flutter ini. Lalu, saya membuat proyek Flutter baru dengan mengetik perintah flutter create my_dairy_mobile, kemudian masuk ke direktori proyek tersebut. Setelah itu, saya menjalankan proyek dengan perintah flutter run di Terminal untuk memastikan aplikasi berjalan dengan lancar di emulator atau perangkat yang terhubung.

2. Membuat tiga tombol sederhana dengan ikon dan teks untuk: Melihat daftar produk (Lihat Daftar Produk), Menambah produk (Tambah Produk), Logout (Logout)
    - Saya membuat tiga tombol sederhana dalam bentuk grid yang masing-masing memiliki ikon dan teks untuk "Lihat Daftar Produk," "Tambah Produk," dan "Logout." Pertama, saya menyimpan data setiap tombol dalam daftar items, yang berisi instance ItemHomepage dengan properti nama, ikon, dan warna yang berbeda. Kemudian, saya merender tombol-tombol ini menggunakan GridView.count, yang menampilkan komponen ItemCard untuk setiap item. Pada ItemCard, saya merancang tombol menggunakan Material dengan warna latar yang spesifik dari item tersebut, serta menampilkan ikon dan teks. Saat tombol diklik, InkWell menghasilkan animasi klik dan menampilkan pesan SnackBar yang menandakan bahwa tombol telah ditekan.

3. Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
    - Untuk mengimplementasikan warna yang berbeda pada setiap tombol, saya membuat daftar items yang berisi tiga objek ItemHomepage, masing-masing mewakili tombol dengan fungsi berbeda: "Lihat Daftar Produk", "Tambah Produk", dan "Logout". Setiap objek ItemHomepage memiliki atribut name, icon, dan color. Setiap atribut color saya bedakan warnanya.

4. Memunculkan Snackbar dengan tulisan: "Kamu telah menekan tombol Lihat Daftar Produk" ketika tombol Lihat Daftar Produk ditekan., "Kamu telah menekan tombol Tambah Produk" ketika tombol Tambah Produk ditekan., "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
    - Di bagian onTap dari ItemCard, saya menambahkan logika untuk menampilkan Snackbar dengan pesan sesuai tombol yang ditekan. Misalnya, "Kamu telah menekan tombol Lihat Daftar Produk" akan muncul ketika saya menekan tombol “Lihat Daftar Produk”. Saya menggunakan ScaffoldMessenger.of(context) untuk mengelola Snackbar, memastikan bahwa setiap pesan tampil dengan benar di layar.