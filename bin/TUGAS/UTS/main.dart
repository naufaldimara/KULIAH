//membuat class abstract
abstract class Transportasi{

  //Atribut
  int id;
  String nama;
  double _tarifDasar;//private
  int kapasitas;

  //membuaat method getter untuk akses tarif dasar
  double get tarifDasar =>_tarifDasar;

  //Konstruktor
  Transportasi(this.id, this.nama, this._tarifDasar,this.kapasitas);

  //method abstract : harus diimplementasikan di subclass
  double hitungTarif(int jumlahPenumpang);

  //method untuk menampilkan info transportasi
  void tampilInfo(){
    print('ID:$id');
    print('Nama:$nama');
    print('Kapasitas:$kapasitas');
    print('Tarif Dasar:$tarifDasar');
  }

}

//kelas taksi  turunan dari kelas transportasi
class Taksi extends Transportasi{

  //atribut
  double jarak;

  //konstruktor
  Taksi(int id , String nama, double tarifDasar,int kapasitas, this.jarak):super(id,nama ,tarifDasar,kapasitas);

  //menimpa method dari kelas induk
  @override
  double hitungTarif(int jumlahPenumpang){
    return _tarifDasar * jarak;
  }

  //menimpa method dari kelas induk
  @override
  void tampilInfo(){
    super.tampilInfo();
    print('Jarak: $jarak km');
  }

}

class Bus extends Transportasi{

  //atribut
  bool adaWifi;

  //konstruktor
  Bus(int id , String nama, double tarifDasar,int kapasitas, this.adaWifi):super(id,nama ,tarifDasar,kapasitas);

  //menimpa method dari kelas induk
  @override
  double hitungTarif(int jumlahPenumpang){
    return  (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);
  }

  //menimpa method dari kelas induk
  @override
  void tampilInfo(){
    super.tampilInfo();
    print('ADa Wifi?:');
  }

}
//kelas Pesawat turunan dari kelas transportasi
class Pesawat extends Transportasi{

  //atribut
  String kelas;

  //konstruktor
  Pesawat(int id , String nama, double tarifDasar,int kapasitas, this.kelas):super(id,nama ,tarifDasar,kapasitas);

  //menimpa method dari kelas induk
  @override
  double hitungTarif(int jumlahPenumpang){
    return tarifDasar * jumlahPenumpang * (kelas == "Bisnis" ? 1.5 : 1.0);
  }

  //menimpa method dari kelas induk
  @override
  void tampilInfo(){
    super.tampilInfo();
    print('Kelas:$kelas');
  }

}

//membuat kelas pemesanan
class Pemesanan{
  //atribut 
  int idPemesanan;
  String namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double totalTarif;

  //konstruktor
  Pemesanan(this.idPemesanan,this.namaPelanggan,this.transportasi,this.jumlahPenumpang,this.totalTarif);

  //menampilkan struk pemesanan
  void cetakStruk(){
    print('ID Pemesanan:$idPemesanan');
    print('Nama Pelanggan:$namaPelanggan');
    print('Transportasi:${transportasi.nama}');
    print('Jumlah Penumpang:$jumlahPenumpang');
    print('Total Tarif:$totalTarif');
  }

  //mengubah data pemesanan mnjadi map (simulasi databse)
  Map<String , dynamic>toMap(){
    return {
      'idpemesanan':idPemesanan,
      'Nama Pelanggan':namaPelanggan,
      'Transportasi':transportasi.nama,
      'jumlahPenumpang':jumlahPenumpang,
      'totalTarif':totalTarif
    };
  }
}


int counterPemesanan=0;

//fungsi global
Pemesanan buatPemesanan(Transportasi t , String nama , int jumlahPenumpang){
  counterPemesanan++;
  int idPemesanan=counterPemesanan;
  double total=t.hitungTarif(jumlahPenumpang);
  return Pemesanan(idPemesanan,nama, t, jumlahPenumpang, total);
  
}

//Menampilkan semua Pemesanan 
void tampilSemuaPemesanan(List<Pemesanan>daftar){
  for (var p in daftar ){
    p.cetakStruk();
    print("==========================================");
  }
}
//fungsi utama
void main(){
  //membuat objek Transportasi

  var taksinaufal=Taksi(1,"Bluebird",5000,4,10);//jarak 10km
  var Busnaufal=Bus(2,"Transjakarta",3000,30,true);//wifi ada atau tidak
  var pesawatnaufal=Pesawat(3,"GAruda indonesia",100000,150,"Bisnis");//kelas bisnis

  //list untuk semua pemesanan
  List<Pemesanan>semuaPemesanan=[];

  //membuat beberapa pemesanan
  semuaPemesanan.add(buatPemesanan(taksinaufal,"Naufal",2));
  semuaPemesanan.add(buatPemesanan(Busnaufal,"FErnando",5));
  semuaPemesanan.add(buatPemesanan(pesawatnaufal,"elpablo",3));

  //menampilkna info tiap transportasi 
  taksinaufal.tampilInfo();
  print("---------------------------------");
  Busnaufal.tampilInfo();
  print("---------------------------------");
  pesawatnaufal.tampilInfo();
  print("===============================================");

  //menampilkan semua pemesanan
  tampilSemuaPemesanan(semuaPemesanan);
}
