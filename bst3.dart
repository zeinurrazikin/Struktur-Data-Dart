// Kelas untuk merepresentasikan node dalam Binary Search Tree (BST)
class STNode<T extends Comparable<dynamic>> {
  // Properti untuk menyimpan nilai node dengan tipe generik T
  T nodeValue;
  // Referensi ke anak kiri, bersifat opsional (bisa null)
  STNode<T>? left;
  // Referensi ke anak kanan, bersifat opsional (bisa null)
  STNode<T>? right;
  // Referensi ke node induk, bersifat opsional (bisa null)
  STNode<T>? parent;

  // Konstruktor untuk membuat node baru dengan nilai dan induk opsional
  STNode(this.nodeValue, [this.parent]) {
    // Inisialisasi anak kiri sebagai null saat node dibuat
    left = null;
    // Inisialisasi anak kanan sebagai null saat node dibuat
    right = null;
  }
}

// Kelas untuk mengelola Binary Search Tree dengan tipe generik T
class BinarySearchTree<T extends Comparable<dynamic>> {
  // Properti untuk menyimpan referensi ke node akar, bersifat opsional (bisa null)
  STNode<T>? root;
  // Properti untuk melacak jumlah node dalam pohon, diinisialisasi dengan 0
  int treeSize = 0;

  // Konstruktor untuk membuat pohon biner pencarian kosong
  BinarySearchTree() {
    // Mengatur akar pohon sebagai null saat pohon dibuat
    root = null;
  }

  // Metode untuk menambahkan node baru dengan nilai tertentu ke pohon
  bool add(T item) {
    // Memeriksa apakah pohon kosong (root null)
    if (root == null) {
      // Membuat node baru sebagai akar pohon
      root = STNode(item);
      // Menambah jumlah node dalam pohon
      treeSize++;
      // Mengembalikan true karena penambahan berhasil
      return true;
    }

    // Menginisialisasi variabel current dengan node akar untuk traversal
    STNode<T>? current = root;
    // Variabel untuk menyimpan referensi ke node induk
    STNode<T>? parent;
    // Variabel untuk menyimpan hasil perbandingan nilai
    int comparison = 0;

    // Melakukan traversal untuk menemukan posisi penambahan node baru
    while (current != null) {
      // Menyimpan node saat ini sebagai induk
      parent = current;
      // Membandingkan item baru dengan nilai node saat ini
      comparison = item.compareTo(current.nodeValue);

      // Jika item sama dengan nilai node, kembalikan false (duplikat)
      if (comparison == 0) {
        return false; // Nilai sudah ada dalam pohon
      // Jika item lebih kecil, lanjut ke anak kiri
      } else if (comparison < 0) {
        current = current.left;
      // Jika item lebih besar, lanjut ke anak kanan
      } else {
        current = current.right;
      }
    }

    // Membuat node baru dengan item dan menghubungkannya ke induk
    STNode<T> newNode = STNode(item, parent);
    // Jika item lebih kecil dari induk, tempatkan di anak kiri
    if (comparison < 0) {
      parent!.left = newNode;
    // Jika item lebih besar dari induk, tempatkan di anak kanan
    } else {
      parent!.right = newNode;
    }
    // Menambah jumlah node dalam pohon
    treeSize++;
    // Mengembalikan true karena penambahan berhasil
    return true;
  }

  // Metode pembantu untuk mencari node yang mengandung nilai tertentu
  STNode<T>? findNode(T item) {
    // Menginisialisasi variabel current dengan node akar untuk memulai pencarian
    STNode<T>? current = root;

    // Melakukan traversal pohon selama node saat ini tidak null
    while (current != null) {
      // Membandingkan item yang dicari dengan nilai node saat ini
      int comparison = item.compareTo(current.nodeValue);

      // Jika item sama dengan nilai node, kembalikan node saat ini
      if (comparison == 0) {
        return current; // Node dengan nilai yang dicari ditemukan
      // Jika item lebih kecil, lanjut ke anak kiri
      } else if (comparison < 0) {
        current = current.left; // Pindah ke subtree kiri
      // Jika item lebih besar, lanjut ke anak kanan
      } else {
        current = current.right; // Pindah ke subtree kanan
      }
    }

    // Mengembalikan null jika item tidak ditemukan dalam pohon
    return null; // Node tidak ditemukan
  }

  // Metode untuk memeriksa apakah nilai tertentu ada dalam pohon
  bool find(T item) {
    // Memanggil metode findNode untuk mencari node yang mengandung item
    STNode<T>? node = findNode(item);
    
    // Mengembalikan true jika node ditemukan, false jika null
    return node != null;
  }
}

// Fungsi utama untuk menguji implementasi Binary Search Tree
void main() {
  // Membuat instance baru dari BinarySearchTree untuk menyimpan nilai integer
  BinarySearchTree<int> bst = BinarySearchTree<int>();
  
  // Menambahkan beberapa nilai ke dalam pohon secara berurutan
  // Menambahkan nilai 35 sebagai akar
  bst.add(35);
  // Menambahkan nilai 18 ke subtree kiri dari 35
  bst.add(18);
  // Menambahkan nilai 25 ke subtree kanan dari 18
  bst.add(25);
  // Menambahkan nilai 48 ke subtree kanan dari 35
  bst.add(48);
  // Menambahkan nilai 20 ke subtree kiri dari 25
  bst.add(20);
  
  // Menampilkan jumlah total node dalam pohon
  print('Ukuran Tree: ${bst.treeSize}'); // Harusnya menampilkan 5
  
  // Mencari node dengan nilai 5 menggunakan metode findNode
  var foundNode = bst.findNode(5);
  // Memeriksa apakah node ditemukan
  if (foundNode != null) {
    // Jika node ditemukan, tampilkan nilai node
    print('Node ditemukan dengan nilai: ${foundNode.nodeValue}');
  } else {
    // Jika node tidak ditemukan, tampilkan pesan bahwa node tidak ada
    print('Node tidak ditemukan.'); // Ini yang akan ditampilkan
  }
  
  // Mencari nilai 5 menggunakan metode find
  bool isFound = bst.find(5);
  // Memeriksa apakah nilai 5 ditemukan
  if (isFound) {
    // Jika ditemukan, tampilkan pesan bahwa node ditemukan
    print('Node ditemukan');
  } else {
    // Jika tidak ditemukan, tampilkan pesan bahwa node tidak ada
    print('Node tidak ditemukan.'); // Ini yang akan ditampilkan
  }
  
  // Mencari nilai 20 menggunakan metode find
  isFound = bst.find(20);
  // Memeriksa apakah nilai 20 ditemukan
  if (isFound) {
    // Jika ditemukan, tampilkan pesan bahwa node 20 ditemukan
    print('Node 20 ditemukan'); // Ini yang akan ditampilkan
  } else {
    // Jika tidak ditemukan, tampilkan pesan bahwa node 20 tidak ada
    print('Node 20 tidak ditemukan');
  }
}