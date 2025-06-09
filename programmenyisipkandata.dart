class Pegawai {
  int nip;
  String nama;

  Pegawai(this.nip, this.nama);

  @override
  String toString() => 'NIP: $nip, Nama: $nama';
}

List<Pegawai> dataPegawai = [
  Pegawai(101, 'Andi'),
  Pegawai(102, 'Budi'),
  Pegawai(103, 'Citra'),
];

void tampilkanData() {
  print('\nDaftar Pegawai:');
  for (var pegawai in dataPegawai) {
    print(pegawai);
  }
}

void sisipkanData({required Pegawai baru, required int nipKunci, required bool sebelum}) {
  int index = dataPegawai.indexWhere((p) => p.nip == nipKunci);
  if (index == -1) {
    print('Data dengan NIP $nipKunci tidak ditemukan!');
    return;
  }

  int posisi = sebelum ? index : index + 1;
  dataPegawai.insert(posisi, baru);
  print('✅ Penyisipan berhasil.');
}

void hapusData(int nipKunci) {
  int index = dataPegawai.indexWhere((p) => p.nip == nipKunci);
  if (index == -1) {
    print('Data dengan NIP $nipKunci tidak ditemukan!');
    return;
  }

  dataPegawai.removeAt(index);
  print('🗑️ Penghapusan berhasil.');
}

void main() {
  tampilkanData();

  // Contoh Penyisipan
  print('\n--- Penyisipan Sebelum NIP 102 ---');
  Pegawai pegawaiBaru = Pegawai(999, 'Zaki');
  sisipkanData(baru: pegawaiBaru, nipKunci: 102, sebelum: true);
  tampilkanData();

  // Contoh Penyisipan Setelah
  print('\n--- Penyisipan Setelah NIP 103 ---');
  Pegawai pegawaiBaru2 = Pegawai(888, 'Lina');
  sisipkanData(baru: pegawaiBaru2, nipKunci: 103, sebelum: false);
  tampilkanData();

  // Contoh Penghapusan
  print('\n--- Penghapusan NIP 102 ---');
  hapusData(102);
  tampilkanData();
}
