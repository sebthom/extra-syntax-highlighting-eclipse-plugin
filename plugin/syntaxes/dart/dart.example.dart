// Import statements
import 'dart:math' as math;

// Function with named parameters and default values
void greet({String name = 'Guest', String greeting = 'Hello'}) {
  print('$greeting, $name!');
}

// Classes and inheritance
class Animal {
  String name;

  Animal(this.name);

  void makeSound() {
    print('Some generic sound');
  }
}

class Dog extends Animal {
  Dog(String name) : super(name);

  // Method override
  @override
  void makeSound() {
    print('Woof! Woof!');
  }

  // Getter
  String get description => 'A loyal companion named $name';
}

// Mixins
mixin Swimmer {
  void swim() {
    print('Swimming!');
  }
}

class Dolphin extends Animal with Swimmer {
  Dolphin(String name) : super(name);
}

// Asynchronous programming
Future<void> fetchUserData() async {
  // Simulating an asynchronous task
  await Future.delayed(Duration(seconds: 2));
  print('User data fetched!');
}

// Higher-order functions and lambda expressions
int operate(int a, int b, int Function(int, int) operation) {
  return operation(a, b);
}

void main() {
  // Using functions
  greet(name: 'John', greeting: 'Hi');

  // Using classes and inheritance
  final dog = Dog('Buddy');
  dog.makeSound();
  print(dog.description);

  final dolphin = Dolphin('Flipper');
  dolphin.makeSound();
  dolphin.swim();

  // Asynchronous programming
  fetchUserData();

  // Higher-order functions and lambda expressions
  final sum = operate(3, 4, (a, b) => a + b);
  print('Sum: $sum');

  final product = operate(3, 4, (a, b) => a * b);
  print('Product: $product');
}
