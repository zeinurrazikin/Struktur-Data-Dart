import 'dart:io';

// Definisi kelas Node untuk menyimpan data dan pointer anak
class Node {
  int key; // Nilai kunci node
  Node? left; // Pointer ke node kiri
  Node? right; // Pointer ke node kanan

  // Konstruktor untuk membuat node baru
  Node(this.key);
}

// Definisi kelas BinarySearchTree untuk mengelola operasi pada pohon
class BinarySearchTree {
  Node? root; // Akar pohon BST

  // Metode untuk menyisipkan nilai ke dalam BST
  void insert(int key) {
    // Memanggil fungsi rekursif _insertRec untuk menyisipkan node baru
    root = _insertRec(root, key);
  }

  // Fungsi rekursif untuk menyisipkan node ke posisi yang tepat
  Node? _insertRec(Node? node, int key) {
    // Jika node kosong, buat node baru dengan nilai key
    if (node == null) return Node(key);

    // Jika key lebih kecil dari node saat ini, sisipkan ke kiri
    if (key < node.key) {
      node.left = _insertRec(node.left, key);
    } 
    // Jika key lebih besar dari node saat ini, sisipkan ke kanan
    else if (key > node.key) {
      node.right = _insertRec(node.right, key);
    }
    // Kembalikan node yang tidak diubah (jika key sama)
    return node;
  }

  // Method untuk mendapatkan nilai terkecil (node paling kiri)
  int? first() {
    // Jika pohon kosong, kembalikan null
    if (root == null) return null;

    // Mulai dari akar dan pergi ke kiri sejauh mungkin
    Node? current = root;
    while (current?.left != null) {
      current = current?.left;
    }
    // Kembalikan nilai node paling kiri
    return current?.key;
  }
}

// Program utama
void main() {
  BinarySearchTree bst = BinarySearchTree(); // Buat instance BST

  // Variabel kontrol untuk loop input
  bool continueInput = true;

  while (continueInput) {
    // Meminta pengguna memasukkan bilangan bulat
    stdout.write("Masukkan bilangan bulat untuk disisipkan (atau 'exit' untuk keluar): ");
    String? input = stdin.readLineSync();

    // Cek apakah pengguna ingin keluar dari loop
    if (input?.toLowerCase() == 'exit') {
      continueInput = false;
      continue;
    }

    // Validasi input untuk memastikan pengguna memasukkan bilangan bulat
    if (input != null && input.isNotEmpty) {
      // Gunakan regex untuk memvalidasi input adalah bilangan bulat
      if (RegExp(r'^-?\d+$').hasMatch(input)) {
        int value = int.parse(input.trim()); // Ubah string ke integer
        bst.insert(value); // Sisipkan nilai ke BST
        print("Nilai $value telah disisipkan."); // Konfirmasi sisipan
      } else {
        // Pesan kesalahan jika input tidak valid
        print("Input tidak valid! Mohon masukkan bilangan bulat atau 'exit' untuk keluar.");
      }
    } else {
      // Pesan kesalahan jika input kosong
      print("Input tidak boleh kosong! Mohon masukkan bilangan bulat atau 'exit' untuk keluar.");
    }
  }

  // Cari dan tampilkan nilai terkecil di BST
  int? minValue = bst.first();
  if (minValue != null) {
    // Tampilkan nilai terkecil jika pohon tidak kosong
    print("\nNilai terkecil di BST: $minValue");
  } else {
    // Tampilkan pesan jika pohon kosong
    print("\nBST kosong!");
  }
}