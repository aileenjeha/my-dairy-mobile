## Tugas 9

#### Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Membuat model penting karena menyediakan struktur yang terdefinisi untuk data yang diterima atau dikirim melalui JSON. Model memastikan konsistensi data, mempermudah validasi, dan mencegah error karena data yang tidak sesuai dengan format atau atribut yang diharapkan. Tanpa model, aplikasi mungkin memproses data yang tidak valid, menyebabkan error runtime atau kesalahan logika dalam aplikasi. Selain itu, model mempermudah manipulasi data di sisi server dengan menyediakan metode bawaan seperti penyimpanan ke database atau serialisasi.

#### Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library http digunakan untuk melakukan komunikasi antara aplikasi Flutter dan server backend. Dengan http, aplikasi dapat mengirim permintaan HTTP seperti GET, POST, PUT, atau DELETE ke server, dan menerima respons berupa data JSON atau format lainnya. Pada tugas ini, library http memfasilitasi pengiriman data seperti produk baru ke server Django dan pengambilan data produk untuk ditampilkan di Flutter.

#### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest digunakan untuk mengelola sesi pengguna dengan menyimpan cookie autentikasi, sehingga pengguna tetap terautentikasi selama sesi berjalan. Instance CookieRequest perlu dibagikan ke seluruh komponen aplikasi agar semua bagian aplikasi dapat berbagi status sesi pengguna yang sama, seperti informasi login atau data autentikasi. Ini memastikan konsistensi akses ke server tanpa perlu autentikasi ulang setiap kali pengguna berpindah halaman.

#### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Mekanisme pengiriman data dimulai dari input pengguna di Flutter yang dikonversi menjadi JSON melalui serialisasi. Data JSON ini dikirim ke server Django melalui permintaan HTTP menggunakan library http. Di server, data JSON diproses menggunakan model yang sesuai, disimpan ke database, dan respons dikembalikan ke Flutter. Di sisi Flutter, respons JSON diubah kembali menjadi objek Dart dan ditampilkan kepada pengguna.

#### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Pada register, data akun pengguna dari Flutter dikirim ke endpoint Django menggunakan metode POST, lalu server menyimpan data ke database jika valid. Saat login, Flutter mengirimkan kredensial ke Django, yang memverifikasi data dan mengembalikan token autentikasi atau cookie jika berhasil. Token ini digunakan untuk mengakses endpoint lain yang membutuhkan autentikasi. Logout dilakukan dengan menghapus cookie atau token di sisi server dan Flutter. Setelah login berhasil, menu di Flutter diperbarui berdasarkan status autentikasi dengan menggunakan token atau cookie tersebut.

#### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1. Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
- Saya membuat halaman registrasi (register.dart) di Flutter dengan formulir input untuk data seperti nama pengguna, email, dan kata sandi. Formulir ini memvalidasi input pengguna sebelum data dikirim ke endpoint register di Django menggunakan metode POST. Setelah registrasi berhasil, aplikasi akan memberikan notifikasi dan mengarahkan pengguna ke halaman login.

2. Membuat halaman login pada proyek tugas Flutter.
- Saya membuat halaman login (login.dart) yang berisi formulir input untuk nama pengguna dan kata sandi. Halaman ini terhubung dengan endpoint login di Django untuk memverifikasi kredensial. Jika login berhasil, cookie autentikasi dari Django disimpan di aplikasi menggunakan CookieRequest, memungkinkan pengguna untuk tetap login hingga logout dilakukan.

3. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
- Untuk mengintegrasikan autentikasi Django, saya menggunakan library CookieRequest di Flutter. Library ini memungkinkan pengelolaan cookie sesi, yang diperlukan untuk login dan logout. Semua permintaan HTTP dari Flutter ke Django menggunakan cookie ini, sehingga hanya pengguna yang terautentikasi dapat mengakses data atau melakukan tindakan tertentu. Integrasi ini juga memungkinkan logout dengan menghapus cookie sesi di Django dan Flutter.

4. Membuat model kustom sesuai dengan proyek aplikasi Django.
- Saya menggunakan situs web Quicktype untuk menghasilkan model Dart berdasarkan data JSON dari Django. Data JSON dari endpoint Django saya salin ke Quicktype untuk menghasilkan model yang sesuai dengan struktur data. Model tersebut saya simpan di folder models/ di Flutter untuk membantu parsing data JSON yang diterima dari server.

5. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy. (Tampilkan name, price, dan description dari masing-masing item pada halaman ini.)
- Saya membuat halaman baru (list_product.dart) yang menggunakan package http untuk mengambil data JSON dari Django. Data yang diterima berupa daftar item dengan atribut seperti name, price, dan description. Data ini kemudian ditampilkan dalam bentuk kartu menggunakan widget ListView.builder. Setiap kartu menampilkan detail atribut item sesuai dengan kebutuhan aplikasi.
- Pada halaman daftar produk, saya memastikan setiap item menampilkan atribut name, price, dan description dengan format yang rapi menggunakan widget Flutter seperti Text dan Card. Untuk memastikan tampilan lebih terstruktur, saya menggunakan padding dan margin di sekitar elemen-elemen tersebut.

6. Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item. (Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item, Tampilkan seluruh atribut pada model item kamu pada halaman ini, Tambahkan tombol untuk kembali ke halaman daftar item)
- Saya memulai implementasi dengan membuat halaman baru bernama product_detail.dart untuk menampilkan detail setiap item. Pada file ini, saya mendesain tampilan menggunakan widget Scaffold dengan judul di AppBar, tombol kembali menggunakan Navigator.pop, dan konten berupa informasi detail dari produk yang diterima melalui parameter product. Setiap atribut model, seperti name, price, description, fatContent, quantity, dan rating, ditampilkan dalam teks yang terstruktur rapi menggunakan widget Column dan Text.
- Selanjutnya, di file list_product.dart, saya menambahkan logika navigasi menggunakan Navigator.push. Ketika sebuah item pada daftar ditekan, saya menggunakan widget GestureDetector untuk mendeteksi klik, lalu memindahkan pengguna ke halaman detail dengan mengirim data produk melalui konstruktor halaman detail. Saya juga memastikan bahwa tombol kembali di halaman detail dapat mengarahkan pengguna kembali ke halaman daftar item dengan lancar. 

7. Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
- Saya memodifikasi endpoint Django agar hanya mengembalikan data yang terasosiasi dengan pengguna yang login. Filter ini diterapkan di query model Django menggunakan atribut request.user. Di Flutter, saya menggunakan cookie sesi untuk memastikan hanya pengguna terautentikasi yang dapat mengakses halaman daftar item, sehingga data yang ditampilkan bersifat spesifik untuk pengguna tersebut.

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