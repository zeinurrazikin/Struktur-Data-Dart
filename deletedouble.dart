// Program Double Linked List dengan operasi delete berdasarkan target dan posisi
// dengan traversal forward atau reversed direction

// Kelas Node untuk Double Linked List
class DNode<T> {
  T data;        // Nilai data yang disimpan dalam node
  DNode<T>? next; // Pointer ke node berikutnya, null jika node terakhir
  DNode<T>? prev; // Pointer ke node sebelumnya, null jika node pertama
  
  // Constructor untuk membuat node baru
  DNode(this.data);
  
  // Override toString untuk mempermudah pencetakan node
  @override
  String toString() => 'DNode(data: $data)';
}

// Enum untuk menentukan arah traversal list
enum Direction {
  forward,  // Dari head ke tail
  reversed  // Dari tail ke head
}

// Kelas Double Linked List
class DoubleLinkedList<T> {
  DNode<T>? head; // Pointer ke node pertama
  DNode<T>? tail; // Pointer ke node terakhir
  int _size = 0;  // Jumlah elemen dalam list
  
  // Getter untuk mendapatkan jumlah elemen
  int get size => _size;
  
  // Memeriksa apakah list kosong
  bool isEmpty() => head == null;
  
  // Menambahkan node di awal list (head)
  void addFirst(T data) {
    // Buat node baru
    final newNode = DNode<T>(data);
    
    if (isEmpty()) {
      // Jika list kosong, head dan tail adalah node baru
      head = newNode;
      tail = newNode;
    } else {
      // Jika list tidak kosong, hubungkan node baru ke head
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
    
    // Tambahkan jumlah elemen
    _size++;
  }
  
  // Menambahkan node di akhir list (tail)
  void addLast(T data) {
    // Buat node baru
    final newNode = DNode<T>(data);
    
    if (isEmpty()) {
      // Jika list kosong, head dan tail adalah node baru
      head = newNode;
      tail = newNode;
    } else {
      // Jika list tidak kosong, hubungkan node baru ke tail
      newNode.prev = tail;
      tail!.next = newNode;
      tail = newNode;
    }
    
    // Tambahkan jumlah elemen
    _size++;
  }
  
  // Menambahkan node pada posisi tertentu (index dimulai dari 0)
  void addAt(int position, T data) {
    // Validasi posisi
    if (position < 0 || position > _size) {
      throw RangeError('Posisi $position tidak valid, ukuran list: $_size');
    }
    
    // Jika posisi di awal, gunakan addFirst
    if (position == 0) {
      addFirst(data);
      return;
    }
    
    // Jika posisi di akhir, gunakan addLast
    if (position == _size) {
      addLast(data);
      return;
    }
    
    // Posisi di tengah, cari posisi yang tepat
    DNode<T>? current;
    int i;
    
    // Jika posisi lebih dekat ke head, mulai dari head
    if (position <= _size ~/ 2) {
      current = head;
      i = 0;
      while (i < position - 1) {
        current = current!.next;
        i++;
      }
    } else {
      // Posisi lebih dekat ke tail, mulai dari tail
      current = tail;
      i = _size - 1;
      while (i > position) {
        current = current!.prev;
        i--;
      }
      current = current!.prev; // Mundur satu posisi untuk disisipkan setelahnya
    }
    
    // Buat dan sisipkan node baru
    final newNode = DNode<T>(data);
    newNode.next = current!.next;
    newNode.prev = current;
    current.next!.prev = newNode;
    current.next = newNode;
    
    // Tambahkan jumlah elemen
    _size++;
  }
  
  // Menghapus node berdasarkan nilai target
  bool deleteByValue(T target) {
    // Jika list kosong, tidak ada yang bisa dihapus
    if (isEmpty()) {
      print("List kosong, tidak ada yang bisa dihapus");
      return false;
    }
    
    // Mulai pencarian dari head
    DNode<T>? current = head;
    
    // Iterasi sampai menemukan nilai atau mencapai akhir list
    while (current != null) {
      if (current.data == target) {
        // Nilai ditemukan, hapus node ini
        
        // Kasus 1: Node yang dihapus adalah head
        if (current == head) {
          head = head!.next;
          if (head != null) {
            head!.prev = null;
          } else {
            // Jika list menjadi kosong, update tail juga
            tail = null;
          }
        } 
        // Kasus 2: Node yang dihapus adalah tail
        else if (current == tail) {
          tail = tail!.prev;
          tail!.next = null;
        } 
        // Kasus 3: Node yang dihapus berada di tengah
        else {
          current.prev!.next = current.next;
          current.next!.prev = current.prev;
        }
        
        // Putuskan koneksi node yang dihapus
        current.prev = null;
        current.next = null;
        
        // Kurangi jumlah elemen
        _size--;
        
        print("Berhasil menghapus node dengan nilai $target");
        return true;
      }
      
      // Lanjut ke node berikutnya
      current = current.next;
    }
    
    // Nilai target tidak ditemukan
    print("Nilai $target tidak ditemukan dalam list");
    return false;
  }
  
  // Menghapus node berdasarkan posisi dengan arah traversal tertentu
  bool deleteByPosition(int position, {Direction direction = Direction.forward}) {
    // Validasi posisi
    if (isEmpty()) {
      print("List kosong, tidak ada yang bisa dihapus");
      return false;
    }
    
    if (position < 0 || position >= _size) {
      print("Posisi $position tidak valid, ukuran list: $_size");
      return false;
    }
    
    // Definisikan node yang akan dihapus berdasarkan arah traversal
    DNode<T>? nodeToDelete;
    
    // Forward: Dari head ke tail (indeks 0 adalah head)
    if (direction == Direction.forward) {
      // Kasus khusus: posisi di awal list
      if (position == 0) {
        nodeToDelete = head;
        head = head!.next;
        
        if (head != null) {
          head!.prev = null;
        } else {
          // List menjadi kosong
          tail = null;
        }
        
        // Putuskan koneksi node yang dihapus
        nodeToDelete!.next = null;
        
        // Kurangi jumlah elemen
        _size--;
        
        print("Berhasil menghapus node pada posisi $position (arah forward)");
        return true;
      }
      
      // Kasus khusus: posisi di akhir list
      if (position == _size - 1) {
        nodeToDelete = tail;
        tail = tail!.prev;
        tail!.next = null;
        
        // Putuskan koneksi node yang dihapus
        nodeToDelete!.prev = null;
        
        // Kurangi jumlah elemen
        _size--;
        
        print("Berhasil menghapus node pada posisi $position (arah forward)");
        return true;
      }
      
      // Posisi di tengah, temukan node dengan iterasi
      nodeToDelete = head;
      for (int i = 0; i < position; i++) {
        nodeToDelete = nodeToDelete!.next;
      }
      
      // Ubah pointer node sebelum dan sesudah
      nodeToDelete!.prev!.next = nodeToDelete.next;
      nodeToDelete.next!.prev = nodeToDelete.prev;
      
      // Putuskan koneksi node yang dihapus
      nodeToDelete.prev = null;
      nodeToDelete.next = null;
      
      // Kurangi jumlah elemen
      _size--;
      
      print("Berhasil menghapus node pada posisi $position (arah forward)");
      return true;
    } 
    // Reversed: Dari tail ke head (indeks 0 adalah tail)
    else {
      // Hitung posisi dari tail (reversed)
      int reversedPosition = _size - 1 - position;
      
      // Kasus khusus: posisi di awal list (tail dalam reversed)
      if (reversedPosition == _size - 1) {
        nodeToDelete = head;
        head = head!.next;
        
        if (head != null) {
          head!.prev = null;
        } else {
          // List menjadi kosong
          tail = null;
        }
        
        // Putuskan koneksi node yang dihapus
        nodeToDelete!.next = null;
        
        // Kurangi jumlah elemen
        _size--;
        
        print("Berhasil menghapus node pada posisi $position (arah reversed)");
        return true;
      }
      
      // Kasus khusus: posisi di akhir list (head dalam reversed)
      if (reversedPosition == 0) {
        nodeToDelete = tail;
        tail = tail!.prev;
        tail!.next = null;
        
        // Putuskan koneksi node yang dihapus
        nodeToDelete!.prev = null;
        
        // Kurangi jumlah elemen
        _size--;
        
        print("Berhasil menghapus node pada posisi $position (arah reversed)");
        return true;
      }
      
      // Posisi di tengah, temukan node dengan iterasi dari tail
      nodeToDelete = tail;
      for (int i = 0; i < reversedPosition; i++) {
        nodeToDelete = nodeToDelete!.prev;
      }
      
      // Ubah pointer node sebelum dan sesudah
      nodeToDelete!.prev!.next = nodeToDelete.next;
      nodeToDelete.next!.prev = nodeToDelete.prev;
      
      // Putuskan koneksi node yang dihapus
      nodeToDelete.prev = null;
      nodeToDelete.next = null;
      
      // Kurangi jumlah elemen
      _size--;
      
      print("Berhasil menghapus node pada posisi $position (arah reversed)");
      return true;
    }
  }
  
  // Menampilkan isi list dari depan ke belakang (head->tail)
  void printForward() {
    if (isEmpty()) {
      print("List kosong");
      return;
    }
    
    print("Forward Direction (head->tail): ");
    DNode<T>? current = head;
    int pos = 0;
    
    while (current != null) {
      print("Pos $pos: ${current.data}");
      current = current.next;
      pos++;
    }
  }
  
  // Menampilkan isi list dari belakang ke depan (tail->head)
  void printReversed() {
    if (isEmpty()) {
      print("List kosong");
      return;
    }
    
    print("Reversed Direction (tail->head): ");
    DNode<T>? current = tail;
    int pos = 0;
    
    while (current != null) {
      print("Pos $pos: ${current.data}");
      current = current.prev;
      pos++;
    }
  }
}

// Fungsi main untuk menguji program
void main() {
  // Buat Double Linked List baru
  final list = DoubleLinkedList<int>();
  
  print("=== Menambahkan elemen ke list ===");
  // Tambahkan beberapa elemen
  list.addFirst(10);
  list.addLast(20);
  list.addLast(30);
  list.addFirst(5);
  list.addAt(2, 15);  // List sekarang: 5->10->15->20->30
  
  // Tampilkan isi list
  print("\n=== Isi list ===");
  list.printForward();
  list.printReversed();
  
  print("\n=== Hapus berdasarkan nilai ===");
  // Hapus node berdasarkan nilai
  list.deleteByValue(15);  // List sekarang: 5->10->20->30
  
  // Tampilkan isi list setelah penghapusan
  print("\n=== Isi list setelah menghapus nilai 15 ===");
  list.printForward();
  
  print("\n=== Hapus berdasarkan posisi (forward) ===");
  // Hapus node berdasarkan posisi dalam arah forward
  list.deleteByPosition(0, direction: Direction.forward);  // Hapus pos 0 (5), List sekarang: 10->20->30
  
  // Tampilkan isi list
  print("\n=== Isi list setelah menghapus posisi 0 (forward) ===");
  list.printForward();
  
  print("\n=== Hapus berdasarkan posisi (reversed) ===");
  // Hapus node berdasarkan posisi dalam arah reversed
  list.deleteByPosition(0, direction: Direction.reversed);  // Hapus pos 0 dari belakang (30), List sekarang: 10->20
  
  // Tampilkan isi list
  print("\n=== Isi list setelah menghapus posisi 0 (reversed) ===");
  list.printForward();
  
  // Tambahkan kembali beberapa elemen
  print("\n=== Menambahkan kembali elemen ===");
  list.addLast(25);
  list.addLast(35);  // List sekarang: 10->20->25->35
  
  // Tampilkan isi list
  print("\n=== Isi list baru ===");
  list.printForward();
  
  // Hapus node di tengah
  print("\n=== Hapus node di tengah berdasarkan posisi ===");
  list.deleteByPosition(1, direction: Direction.forward);  // Hapus pos 1 (20), List sekarang: 10->25->35
  
  // Tampilkan isi list
  print("\n=== Isi list setelah menghapus posisi 1 ===");
  list.printForward();
}