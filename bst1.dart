class STNode<T extends Comparable<dynamic>> {
  // Properti untuk menyimpan nilai node dengan tipe T
  T nodeValue;
  // Properti untuk menyimpan referensi ke anak kiri (opsional)
  STNode<T>? left;
  // Properti untuk menyimpan referensi ke anak kanan (opsional)
  STNode<T>? right;
  // Properti untuk menyimpan referensi ke node induk (opsional)
  STNode<T>? parent;

  // Konstruktor untuk membuat node baru dengan nilai dan induk opsional
  STNode(this.nodeValue, [this.parent]) {
    // Inisialisasi anak kiri sebagai null
    left = null;
    // Inisialisasi anak kanan sebagai null
    right = null;
  }
}

class BinarySearchTree<T extends Comparable<dynamic>> {
  // Properti untuk menyimpan referensi ke node akar (opsional)
  STNode<T>? root;
  // Properti untuk menyimpan jumlah node dalam pohon
  int treeSize = 0;

  // Konstruktor untuk menginisialisasi pohon kosong
  BinarySearchTree() {
    // Set akar ke null saat pohon dibuat
    root = null;
  }

  // Metode untuk menambahkan item baru ke pohon
  bool add(T item) {
    // Jika pohon kosong (akar null), buat node baru sebagai akar
    if (root == null) {
      root = STNode(item);
      // Tambah ukuran pohon
      treeSize++;
      // Kembalikan true karena penambahan berhasil
      return true;
    }

    // Mulai dari akar untuk traversal
    STNode<T>? current = root;
    // Simpan referensi ke node induk
    STNode<T>? parent;
    // Variabel untuk menyimpan hasil perbandingan
    int orderValue = 0;

    // Traversal pohon untuk menemukan posisi penambahan
    while (current != null) {
      // Simpan node saat ini sebagai induk
      parent = current;
      // Bandingkan item baru dengan nilai node saat ini
      orderValue = item.compareTo(current.nodeValue);

      // Jika item sudah ada (orderValue == 0), kembalikan false
      if (orderValue == 0) {
        return false;
      // Jika item lebih kecil, lanjut ke anak kiri
      } else if (orderValue < 0) {
        current = current.left;
      // Jika item lebih besar, lanjut ke anak kanan
      } else {
        current = current.right;
      }
    }

    // Buat node baru dengan item dan induk
    STNode<T> newNode = STNode(item, parent);
    // Jika item lebih kecil dari induk, tambahkan ke anak kiri
    if (orderValue < 0) {
      parent!.left = newNode;
    // Jika item lebih besar dari induk, tambahkan ke anak kanan
    } else {
      parent!.right = newNode;
    }
    // Tambah ukuran pohon
    treeSize++;
    // Kembalikan true karena penambahan berhasil
    return true;
  }
}

// Fungsi utama untuk menguji implementasi BinarySearchTree
void main() {
  // Uji dengan tipe data integer
  // Buat pohon baru untuk menyimpan integer
  var intTree = BinarySearchTree<int>();
  // Tambah nilai 5 dan cetak hasilnya
  print("Menambah 5: ${intTree.add(5)}"); // true
  // Tambah nilai 3 dan cetak hasilnya
  print("Menambah 3: ${intTree.add(3)}"); // true
  // Tambah nilai 7 dan cetak hasilnya
  print("Menambah 7: ${intTree.add(7)}"); // true
  // Coba tambah nilai 5 lagi (duplikat) dan cetak hasilnya
  print("Menambah 5 lagi: ${intTree.add(5)}"); // false

  // Uji dengan tipe data string
  // Buat pohon baru untuk menyimpan string
  var stringTree = BinarySearchTree<String>();
  // Tambah string 'apple' dan cetak hasilnya
  print("\nMenambah 'apple': ${stringTree.add('apple')}"); // true
  // Tambah string 'banana' dan cetak hasilnya
  print("Menambah 'banana': ${stringTree.add('banana')}"); // true
  // Coba tambah string 'apple' lagi (duplikat) dan cetak hasilnya
  print("Menambah 'apple' lagi: ${stringTree.add('apple')}"); // false
}