class Queue {
  Map<int, int> elements = {};
  int front = 0;
  int rear = 0;
  int maxQueue = 0;
  
  void QueueOperation(int max) {
    front = 0;
    rear = -1;
    elements = {}; // Inisialisasi Map kosong, bukan List
    maxQueue = max - 1;
  }

  bool isEmpty() {
    return rear == -1 && front == 0;
  }

  bool isFull() {
    return rear == maxQueue - 1;
  }

  void enqueue(int data) {
    if (isFull()) {
      print("Queue Overflow, tidak dapat mengisi data lagi");
    } else {
      rear += 1;
      elements[rear] = data; // Menyimpan data ke Map dengan key = rear
    }
  }

  int dequeue() {
    int data = 0;
    if (isEmpty()) {
      print("Queue Underflow");
    } else {
      data = elements[front] ?? 0; // Menggunakan null-safety
      elements.remove(front); // Menghapus elemen dari Map
      front += 1;
    }
    return data;
  }

  void printQueue() {
    if (!isEmpty()) {
      print("Menampilkan urutan dari posisi tertinggi");
      for (int i = rear; i > -1; i--) {
        print("Elemen ke-$i = ${elements[i] ?? 0}"); // Menggunakan null-safety
      }
    } else {
      print("Queue masih kosong");
    }
  }
}

void main() {
  Queue q = Queue();
  q.QueueOperation(100);
  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  q.dequeue();
  q.printQueue();
}