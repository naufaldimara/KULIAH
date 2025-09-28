// Mengimpor pustaka dart:io untuk menggunakan input/output dari terminal
import 'dart:io';

void main() {
  // Menampilkan prompt untuk meminta pengguna memasukkan skor
  stdout.write("Skor Anda: ");

  // Membaca input dari pengguna dalam bentuk string
  String? input = stdin.readLineSync();

  // Mencoba mengonversi input ke integer; jika gagal, akan bernilai null
  int? skor = int.tryParse(input ?? '');

  // Validasi: jika input bukan angka, tampilkan pesan error dan hentikan program
  if (skor == null) {
    print("Input tidak valid: harus berupa angka.");
    return;
  }

  // Menentukan grade berdasarkan rentang nilai skor
  if (skor >= 85 && skor <= 100) {
    print("Grade Anda: A");
  } else if (skor >= 70 && skor <= 84) {
    print("Grade Anda: B");
  } else if (skor >= 60 && skor <= 69) {
    print("Grade Anda: C");
  } else if (skor >= 50 && skor <= 59) {
    print("Grade Anda: D");
  } else if (skor >= 0 && skor < 50) {
    print("Grade Anda: E");
  } else {
    // Jika skor di luar rentang 0-100, tampilkan pesan error
    print("Skor tidak valid (harus berada di rentang 0-100)");
  }
}
