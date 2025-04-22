class Stack<T> {
  final List<T> _stack = [];
  
  void push(T element) {
 _stack.add(element);
 }
 
 T pop() {
    if (_stack.isEmpty) {
      throw StateError("No elements in the Stack");
 } else {
  
  T lastElement = _stack.last;
    _stack.removeLast();
    return lastElement;
 }
 }

 T top() {
   if (_stack.isEmpty) {
    throw StateError("No elements in the Stack");
 } else {
    return _stack.last;
  }
 }

bool isEmpty() {
 return _stack.isEmpty;
 }

 @override
 String toString() => _stack.toString();
}

void main() {
  var stack = Stack<int>();
  var test = stack.isEmpty();
  print(test); // Output: true
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  stack.push(5);
  stack.push(7);
  print(stack); // Output: [1, 2, 3, 4, 5, 7]

  var myNumber = stack.pop();
  print('My 1st number is $myNumber');
  var mySecNumber = stack.pop();
  print('My 2nd number is $mySecNumber');

  print(stack.pop()); // Output: 4
  print(stack); // Output: [1, 2, 3]
  print(stack.top()); // Output: 3
  print(stack.isEmpty()); // Output: false
}
