/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'dart:async';
import 'dart:isolate';

export 'src/dart_communication_for_prime_number_base.dart';

// TODO: Export any libraries intended for clients of this package.

Future<bool> verifyPrimeInIsolate(int number) async {
  ReceivePort receivePort = ReceivePort();
  Completer<bool> completer = Completer<bool>();

  await Isolate.spawn(isolate, [receivePort.sendPort, number]);

  receivePort.listen((data) {
    completer.complete(data);
    receivePort.close();
  });

  return completer.future;
}

void isolate(List<dynamic> data) {
  SendPort sendPort = data[0];
  int number = data[1];

  bool isPrime = prime(number);

  sendPort.send(isPrime);
}

bool prime(int number) {
  if (number <= 1) {
    return false;
  }

  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }

  return true;
}

/*
Practice Question 1: Single-Channel Communication for Prime Number Verification
Task:
Create a function verifyPrimeInIsolate that 
checks if a number is prime in a separate isolate
 using single-channel communication. 
 The main isolate sends a number to the spawned isolate, 
 which then returns true or false based on the primality of the number.
 */