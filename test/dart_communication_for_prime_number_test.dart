import 'package:dart_communication_for_prime_number/dart_communication_for_prime_number.dart';
import 'package:test/test.dart';

void main() {
  test('verifyPrimeInIsolate verifies prime numbers correctly', () async {
    expect(await verifyPrimeInIsolate(7), equals(true));
    expect(await verifyPrimeInIsolate(4), equals(false));
    expect(await verifyPrimeInIsolate(11), equals(true));
  });
}
