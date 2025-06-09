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

    // Metode untuk mendapatkan node akar dari pohon
    STNode<T>? getRoot() => root;

    // Metode untuk mencari node yang mengandung nilai tertentu
    STNode<T>? findNode(T item) {
      // Menginisialisasi variabel current dengan node akar untuk memulai pencarian
      STNode<T>? current = root;
      // Melakukan traversal pohon selama node saat ini tidak null
      while (current != null) {
        // Membandingkan item yang dicari dengan nilai node saat ini
        int comparison = item.compareTo(current.nodeValue);
        // Jika item sama dengan nilai node, kembalikan node saat ini
        if (comparison == 0) {
          return current;
        // Jika item lebih kecil, lanjut ke anak kiri
        } else if (comparison < 0) {
          current = current.left;
        // Jika item lebih besar, lanjut ke anak kanan
        } else {
          current = current.right;
        }
      }
      // Mengembalikan null jika item tidak ditemukan dalam pohon
      return null;
    }

    // Metode untuk menghapus node tertentu dari pohon
    void removeNode(STNode<T>? dNode) {
      // Memeriksa apakah node yang akan dihapus adalah null
      if (dNode == null) {
        // Jika null, keluar dari metode tanpa perubahan
        return;
      }

      // Mendapatkan referensi ke node induk dari node yang akan dihapus
      STNode<T>? pNode = dNode.parent;
      // Variabel untuk menyimpan node pengganti (replacement node)
      STNode<T>? rNode;

      // Kasus 1: Node memiliki 0 atau 1 anak
      if (dNode.left == null || dNode.right == null) {
        // Memilih anak yang ada (kiri jika ada, jika tidak gunakan kanan)
        rNode = (dNode.left != null) ? dNode.left : dNode.right;

        // Jika ada node pengganti, atur induknya ke induk node yang dihapus
        if (rNode != null) {
          rNode.parent = pNode;
        }

        // Jika node yang dihapus adalah akar (tidak punya induk)
        if (pNode == null) {
          // Tetapkan node pengganti sebagai akar baru
          root = rNode;
        // Jika node yang dihapus adalah anak kiri dari induknya
        } else if (dNode.nodeValue.compareTo(pNode.nodeValue) < 0) {
          // Hubungkan anak kiri induk ke node pengganti
          pNode.left = rNode;
        // Jika node yang dihapus adalah anak kanan dari induknya
        } else {
          // Hubungkan anak kanan induk ke node pengganti
          pNode.right = rNode;
        }
      } 
      // Kasus 2: Node memiliki 2 anak
      else {
        // Menginisialisasi variabel untuk melacak induk dari node pengganti
        STNode<T>? pOfRNode = dNode;
        // Memulai dari anak kanan node yang akan dihapus
        rNode = dNode.right;

        // Mencari node terkecil di subtree kanan (penerus in-order)
        while (rNode!.left != null) {
          // Memperbarui induk dari node pengganti
          pOfRNode = rNode;
          // Pindah ke anak kiri untuk menemukan nilai terkecil
          rNode = rNode.left;
        }

        // Menyalin nilai dari node terkecil ke node yang akan dihapus
        dNode.nodeValue = rNode.nodeValue;

        // Menghapus node terkecil dari subtree kanan
        // Jika node terkecil adalah anak kanan langsung dari node yang dihapus
        if (pOfRNode == dNode) {
          // Hubungkan anak kanan dari node yang dihapus ke anak kanan node terkecil
          dNode.right = rNode.right;
        // Jika node terkecil berada lebih dalam di subtree
        } else {
          // Hubungkan anak kiri dari induk node terkecil ke anak kanan node terkecil
          pOfRNode!.left = rNode.right;
        }

        // Jika node terkecil memiliki anak kanan, atur induknya ke pOfRNode
        if (rNode.right != null) {
          rNode.right!.parent = pOfRNode;
        }
      }
      // Mengurangi jumlah node dalam pohon setelah penghapusan
      treeSize--;
    }

    // Metode untuk melakukan traversal in-order pada pohon
    void inOrderDisplay(STNode<T>? node) {
      // Memeriksa apakah node saat ini tidak null
      if (node != null) {
        // Rekursif ke anak kiri untuk mengunjungi subtree kiri
        inOrderDisplay(node.left);
        // Mencetak nilai node saat ini
        print(node.nodeValue);
        // Rekursif ke anak kanan untuk mengunjungi subtree kanan
        inOrderDisplay(node.right);
      }
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
    
    // Mendapatkan node akar dan menampilkan nilainya
    STNode<int>? rootNode = bst.getRoot();
    // Memeriksa apakah akar tidak null
    if (rootNode != null) {
      // Menampilkan nilai akar jika pohon tidak kosong
      print('Root Value: ${rootNode.nodeValue}');
    } else {
      // Menampilkan pesan jika pohon kosong
      print('The tree is empty.');
    }
    
    // Menampilkan isi pohon dalam urutan in-order sebelum penghapusan
    print('InOrder Display Before Removal:');
    // Memanggil metode inOrderDisplay dengan node akar
    bst.inOrderDisplay(bst.getRoot());
    
    // Mencari node dengan nilai 20 untuk dihapus
    STNode<int>? nodeToRemove = bst.findNode(20);
    // Menghapus node yang ditemukan
    bst.removeNode(nodeToRemove);
    
    // Menampilkan isi pohon dalam urutan in-order setelah penghapusan
    print('InOrder Display After Removal:');
    // Memanggil metode inOrderDisplay dengan node akar setelah penghapusan
    bst.inOrderDisplay(bst.getRoot());
  }