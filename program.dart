import 'dart:io';
void main(){ 
  Map<String, String> hargaAyam = {
    'D': '10.000',
    'P': '5.000',
    'S': '2.000',
  };

  print('=====> GEROBAK FRIED CHICKEN <=====');
  print('---------------------------------');
  print('Kode   Jenis   Harga');
  print('---------------------------------');
  print('D      Dada    Rp. 10.000,00');
  print('P      Paha    Rp. 5.000,00');
  print('S      Sayap   Rp. 2.000,00');
  print('---------------------------------');

    stdout.write('Banyak Jenis: ');
      int banyakJenis = int.parse(stdin.readLineSync()!);

    double totalHarga = 0;

for (int i = 0; i < banyakJenis; i++){
  stdout.write('Jenis ke: ${i + 1} (D/P/S): ');
  String jenisPotong = stdin.readLineSync()!.toUpperCase();
  
  stdout.write('Banyak Potong: ');
  int banyakPotong = int.parse(stdin.readLineSync()!);

  double hargaSatuan = double.parse(hargaAyam[jenisPotong]!);
  double jumlahHarga = hargaSatuan * banyakPotong;
  totalHarga += jumlahHarga;

  print('---------------');
  print('No.   Jenis Potong    Harga Satuan    Banyak Beli   Jumlah Harga');
  print('${i + 1 }        $jenisPotong            Rp. ${hargaSatuan.toStringAsFixed(3)}       $banyakPotong             Rp. ${jumlahHarga.toStringAsFixed(3)}');
} 

double pajak = totalHarga * 0.1;
double totaBayar = totalHarga + pajak;

print('-------------');
print('Jumlah Bayar Rp. ${totalHarga.toStringAsFixed(3)}');
print('Pajak  10%   Rp. ${pajak.toStringAsFixed(3)}');
print('Total  Bayar Rp. ${totaBayar.toStringAsFixed(3)}');

}