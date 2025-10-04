import 'dart:io';

void main() {
  // Daftar menu makanan dan harga
  var makanan = {
    'Ayam Lalap': 19000,
    'Nasi Goreng': 20000,
    'Ayam Bakar': 19000,
    'Nasi Kuning': 15000,
    'Bakso': 22000,
    'Mie Pangsit': 21000
  };

  // Daftar menu minuman dan harga
  var minuman = {
    "Air Putih": 0,
    "Es Teh": 5000,
    "Jus Jeruk": 8000,
    "Kopi Hitam": 10000,
    "Cappuccino": 15000,
    "Air Mineral": 3000
  };

  // Konversi Map ke List agar bisa diakses berdasarkan indeks
  var daftarMakanan = makanan.entries.toList();
  var daftarMinuman = minuman.entries.toList();

  // Variabel untuk menyimpan total harga makanan dan minuman
  int totalMinuman = 0;
  int totalMakanan = 0;

  // List untuk menyimpan semua pesanan yang ditambahkan
  List<String> keranjang = [];

  // Loop utama program
  while (true) {
    // Tampilan menu utama
    print('\n' + '=' * 50);
    print('🍽️  SELAMAT DATANG DI RESTORAN NAUFAL  🍽️');
    print('=' * 50);
    print('1. ⭐ Lihat Menu');
    print('2. ➕ Tambah Pesanan');
    print('3. 🛒 Lihat Keranjang');
    print('4. 💳 Bayar');
    print('5. ❌ Keluar');
    print('-' * 50);

    // Input pilihan menu
    stdout.write('Masukkan Pilihan [1-5]: ');
    String? input = stdin.readLineSync();
    int pilihan = int.tryParse(input ?? '') ?? 0;

    // Menu 1: Tampilkan daftar makanan dan minuman
    if (pilihan == 1) {
      print('\n' + '=' * 30);
      print('🍛 DAFTAR MENU MAKANAN');
      print('=' * 30);
      int nomor = 1;
      makanan.forEach((nama, int harga) {
        print('$nomor. $nama\t\tRp. $harga');
        nomor++;
      });

      print('\n' + '=' * 30);
      print('🥤 DAFTAR MENU MINUMAN');
      print('=' * 30);
      nomor = 1;
      minuman.forEach((nama, int harga) {
        print('$nomor. $nama\t\tRp. $harga');
        nomor++;
      });

    // Menu 2: Tambah pesanan makanan dan minuman
    } else if (pilihan == 2) {
      // Loop pemesanan makanan
      String? konfirmasi_pesanan_makanan = 'y';
      while (konfirmasi_pesanan_makanan == 'y') {
        print('\n' + '*' * 40);
        print('🍽️  PESANAN MAKANAN');
        print('*' * 40);
        int nomor = 1;
        makanan.forEach((nama, int harga) {
          print('$nomor. $nama\t\tRp. $harga');
          nomor++;
        });

        // Input pilihan makanan
        stdout.write('Pilih Makanan (1-${makanan.length}): ');
        int pilihanmakanan = int.parse(stdin.readLineSync()!);
        var item = daftarMakanan[pilihanmakanan - 1];

        // Input jumlah makanan
        stdout.write('Jumlah ${item.key} yang ingin dipesan: ');
        int jumlah_makanan = int.parse(stdin.readLineSync()!);

        // Hitung subtotal dan tambahkan ke total
        int subtotalMakanan = jumlah_makanan * item.value;
        totalMakanan += subtotalMakanan;

        // Tambahkan ke keranjang
        keranjang.add("${item.key} x$jumlah_makanan = Rp $subtotalMakanan");

        print('✅ ${item.key} berhasil ditambahkan!');
        stdout.write('Tambah makanan lain? [y/n]: ');
        konfirmasi_pesanan_makanan = stdin.readLineSync();
      }

      // Loop pemesanan minuman
      String? konfirmasi_pesanan_minuman = 'y';
      while (konfirmasi_pesanan_minuman == 'y') {
        print('\n' + '*' * 40);
        print('🥤  PESANAN MINUMAN');
        print('*' * 40);
        int nomor = 1;
        minuman.forEach((nama, int harga) {
          print('$nomor. $nama\t\tRp. $harga');
          nomor++;
        });

        // Input pilihan minuman
        stdout.write('Pilih Minuman (1-${minuman.length}): ');
        int pilihanminuman = int.parse(stdin.readLineSync()!);
        var item = daftarMinuman[pilihanminuman - 1];

        // Input jumlah minuman
        stdout.write('Jumlah ${item.key} yang ingin dipesan: ');
        int jumlah_minuman = int.parse(stdin.readLineSync()!);

        // Hitung subtotal dan tambahkan ke total
        int subtotaljumlah_minuman = jumlah_minuman * item.value;
        totalMinuman += subtotaljumlah_minuman;

        // Tambahkan ke keranjang
        keranjang.add("${item.key} x$jumlah_minuman = Rp $subtotaljumlah_minuman");

        print('✅ ${item.key} berhasil ditambahkan!');
        stdout.write('Tambah minuman lain? [y/n]: ');
        konfirmasi_pesanan_minuman = stdin.readLineSync();
      }

    // Menu 3: Lihat isi keranjang
    } else if (pilihan == 3) {
      print('\n' + '=' * 40);
      print('🛒 KERANJANG PESANAN');
      print('=' * 40);
      if (keranjang.isEmpty) {
        print('📭 Keranjang masih kosong.');
      } else {
        keranjang.forEach((item) => print('• $item'));
        print('-' * 40);
        print('Total Makanan : Rp $totalMakanan');
        print('Total Minuman : Rp $totalMinuman');
        print('TOTAL KESELURUHAN: Rp ${totalMakanan + totalMinuman}');
      }

    // Menu 4: Proses pembayaran
    } else if (pilihan == 4) {
      int total = totalMakanan + totalMinuman;
      if (total == 0) {
        print('\n❌ Anda belum memesan apapun.');
        continue;
      }

      print('\n' + '=' * 40);
      print('💳 PEMBAYARAN');
      print('=' * 40);
      print('Total yang harus dibayar: Rp $total');
      stdout.write('Masukkan jumlah uang: Rp ');
      int bayar = int.parse(stdin.readLineSync()!);

      // Validasi jumlah uang
      if (bayar < total) {
        print('❌ Uang tidak cukup. Kurang: Rp ${total - bayar}');
      } else {
        int kembalian = bayar - total;
        print('✅ Pembayaran berhasil!');
        print('💵 Kembalian Anda: Rp $kembalian');

        // Reset semua pesanan dan total
        keranjang.clear();
        totalMakanan = 0;
        totalMinuman = 0;
      }

    // Menu 5: Keluar dari program
    } else if (pilihan == 5) {
      print('\n👋 Terima kasih telah berkunjung!');
      print('Semoga hari Anda menyenangkan!');
      print('=' * 50);
      break;

    // Jika input tidak valid
    } else {
      print('❗ Pilihan tidak valid. Silakan coba lagi.');
    }
  }
}