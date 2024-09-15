import 'package:flutter_project_template/util/clamp.dart';
import 'package:test/test.dart';

void clampTest() {
  group('function clamp() /', () {
    test('clamp(1)', () {
      expect(clamp(1), 1);
    });
    test('clamp(0, min: -1)', () {
      expect(clamp(0, min: -1), 0);
    });
    test('clamp(-2, min: -1)', () {
      expect(clamp(-2, min: -1), -1);
    });
    test('clamp(2, max: 1)', () {
      expect(clamp(2, max: 1), 1);
    });
    test('clamp(0, max: 1)', () {
      expect(clamp(0, max: 1), 0);
    });
    test('clamp(0, min: -1, max: 1)', () {
      expect(clamp(0, min: -1, max: 1), 0);
    });
    test('clamp(-2, min: -1, max: 1)', () {
      expect(clamp(-2, min: -1, max: 1), -1);
    });
    test('clamp(2, min: -1, max: 1)', () {
      expect(clamp(2, min: -1, max: 1), 1);
    });
    test("clamp(0, min: 1, max: -1)", () {
      expect(
        () => clamp(0, min: 1, max: -1),
        throwsArgumentError,
      );
    });
  });
}
