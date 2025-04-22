import 'dart:io';

class Stack {
   List<String> _items = [];
  
  void push(String item) {
    _items.add(item);
 }
 
 String pop() {
  if (isEmpty()) {
  throw Exception('Stack is empty');
}
 return _items.removeLast();
 }

 String top() {
   if (isEmpty()) {
    throw Exception('Stack is empty');
 }
 return _items.last;
 }

 bool isEmpty() {
 return _items.isEmpty;
 }
}

class PostfixToInfix {
   String postfixExp = "";
 
  String toInfix(String postfixExp) {
  var stack = Stack();
  for (var ch in postfixExp.split('')) {
    if (_isOperator(ch)) {
      var operand2 = stack.pop();
      var operand1 = stack.pop();
      var result = '($operand1$ch$operand2)';
      stack.push(result);
 } else {
 stack.push(ch);
 }
 }
 return stack.pop();
 }
  bool _isOperator(String ch) {
 return ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch ==
'^';
 }
}
void main() {
 var pti = PostfixToInfix();
 String postfixExp;
 stdout.write("Postfix Expression : ");
 postfixExp = stdin.readLineSync()!;
 print("Infix Expression : ${pti.toInfix(postfixExp)}");
}