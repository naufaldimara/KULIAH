void main() {
  // Inisialisasi data karyawan
  String namaKaryawan = "Naufal Dimara";
  int jamKerja = 110;
  double upahPerJam = 672000; // 672 ribu per jam
  bool statusKaryawan = true; // true = tetap, false = kontrak

  // Hitung gaji kotor (sebelum pajak)
  double gajiKotor = jamKerja * upahPerJam;

  // Inisialisasi pajak
  double pajak = 0;

  // Hitung pajak berdasarkan status karyawan
  if (statusKaryawan == true) {
    pajak = gajiKotor * 10 / 100; // Pajak 10% untuk karyawan tetap
  } else {
    pajak = gajiKotor * 5 / 100;  // Pajak 5% untuk karyawan kontrak
  }

  // Hitung gaji bersih setelah dipotong pajak
  double gajiBersih = gajiKotor - pajak;

  // Tampilkan informasi karyawan
  print("==== INFORMASI KARYAWAN ====");
  print("Nama Karyawan\t= $namaKaryawan");
  print("Gaji Kotor\t= Rp. $gajiKotor");
  print("Pajak\t\t= Rp. $pajak");
  print("Gaji Bersih\t= Rp. $gajiBersih");
  print("============================");
}
